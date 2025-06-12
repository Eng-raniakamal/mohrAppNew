import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:equatable/equatable.dart';

class VacationBalanceState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final VacationBalanceResponseModel? balance;

  const VacationBalanceState({
    this.isLoading = false,
    this.errorMessage,
    this.balance,
  });

  VacationBalanceState copyWith({
    bool? isLoading,
    String? errorMessage,
    VacationBalanceResponseModel? balance,
  }) {
    return VacationBalanceState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, balance];
}
