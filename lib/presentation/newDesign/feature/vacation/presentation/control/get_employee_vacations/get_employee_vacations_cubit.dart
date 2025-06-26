
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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

class GetEmployeeVacationsCubit extends Cubit<GetEmployeeVacationsState> {
  final GetEmployeeVacationsUseCase getEmployeeVacationsUseCase;

  GetEmployeeVacationsCubit({
    required this.getEmployeeVacationsUseCase,
  }) : super(GetEmployeeVacationsState());

  // Future<void> getEmployeeVacations() async {
  //   emit(state.copyWith(isLoading: true));
  //   final response = await getEmployeeVacationsUseCase();
  //   response.fold(
  //         (failure) {
  //       emit(state.copyWith(isLoading: false, errorMessage: failure.message));
  //     },
  //         (vacations) {
  //       emit(state.copyWith(isLoading: false, response: vacations));
  //     },
  //   );
  // }

  Future<void> getEmployeeVacations() async {
    if (isClosed) return;                           // ← حماية قبل emit الأول
    emit(state.copyWith(isLoading: true));

    final response = await getEmployeeVacationsUseCase();
    if (isClosed) return;                           // ← حماية بعد الانتظار

    response.fold(
          (failure) {
        if (isClosed) return;                       // ← حماية قبل emit الخطأ
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
          (vacations) {
        if (isClosed) return;                       // ← حماية قبل emit النتيجة
        emit(state.copyWith(isLoading: false, response: vacations));
      },
    );
  }
}