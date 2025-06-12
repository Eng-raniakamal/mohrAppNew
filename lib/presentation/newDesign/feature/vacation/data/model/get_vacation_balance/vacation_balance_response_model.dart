class VacationBalanceResponseModel {
  final String? remainingBalance;

  VacationBalanceResponseModel({required this.remainingBalance});

  factory VacationBalanceResponseModel.fromJson(String json) {
    return VacationBalanceResponseModel(
      remainingBalance: json,
    );
  }
}
