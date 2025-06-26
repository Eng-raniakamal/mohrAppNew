
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_vacation_requests_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_vacation_requests_state.dart';


class GetVacationRequestsCubit extends Cubit<GetVacationRequestsResponseState>{
  GetVacationRequestsCubit({required this.getVacationRequestsUseCase}):super(GetVacationRequestsResponseState());
  GetVacationRequestsUseCase getVacationRequestsUseCase ;

  getVacationRequests() async {
    emit(state.copyWith(isLoading: true));
    final response = await getVacationRequestsUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (vacations) {
        emit(state.copyWith(isLoading: false, response: vacations));
      },
    );
  }

}

