
import 'dart:convert';

import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/di.dart';


//
// class GetEmployeeVacationsCubit extends Cubit<GetEmployeeVacationsState> {
//   var getEmployeeVacationsUseCase;
//
//   GetEmployeeVacationsCubit({
//     required this.getEmployeeVacationsUseCase,
//   }) : super(GetEmployeeVacationsState());
//
//
//   getEmployeeVacations() async {
//     emit(state.copyWith(isLoading: true));
//     final response = await getEmployeeVacationsUseCase();
//     response.fold(
//       (failure) {
//         emit(state.copyWith(isLoading: false, errorMessage: failure.message));
//       },
//       (vacations) {
//         emit(state.copyWith(isLoading: false, response: vacations));
//       },
//     );
//   }
//
// }



const String _vacationsCacheKey = "CACHED_EMPLOYEE_VACATIONS";

class GetEmployeeVacationsCubit extends Cubit<GetEmployeeVacationsState> {
  final GetEmployeeVacationsUseCase getEmployeeVacationsUseCase;
  final AppPreferences appPreferences;

  GetEmployeeVacationsCubit({
    required this.getEmployeeVacationsUseCase,
     required this.appPreferences,
  }) : super(GetEmployeeVacationsState());

  static const _vacationsCacheKey = "CACHED_EMPLOYEE_VACATIONS";

  Future<void> getEmployeeVacations() async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true));

    // 1. قراءة من الكاش باستخدام appPreferences
    final cachedData = await appPreferences.getCachedVacations(_vacationsCacheKey);
    if (cachedData != null) {
      emit(state.copyWith(response: cachedData, isLoading: false));
    }

    // 2. جلب من API وتحديث الكاش
    final response = await getEmployeeVacationsUseCase();
    if (isClosed) return;

    response.fold(
          (failure) {
        if (isClosed) return;
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
          (vacations) async {
        if (isClosed) return;
        emit(state.copyWith(isLoading: false, response: vacations));
        await appPreferences.setCachedVacations(_vacationsCacheKey, vacations);
      },
    );
  }
}