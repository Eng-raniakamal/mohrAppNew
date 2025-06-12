import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_vacation_balance_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'vacation_balance_state.dart';

class VacationBalanceCubit extends Cubit<VacationBalanceState> {
  final GetVacationBalanceUseCase getVacationBalanceUseCase;

  VacationBalanceCubit(this.getVacationBalanceUseCase)
      : super(const VacationBalanceState());

  Future<void> getVacationBalance(VacationBalanceRequestModel requestModel) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getVacationBalanceUseCase.call(requestModel: requestModel);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (data) => emit(state.copyWith(isLoading: false, balance: data)),
    );
  }
}
