class VacationBalanceRequestModel {
  final int vacationTypeId;
  final String fromDate;
  final int duration;

  VacationBalanceRequestModel({
    required this.vacationTypeId,
    required this.fromDate,
    required this.duration,
  });

  Map<String, dynamic> toQueryParams() => {
    'vacationTypeId': vacationTypeId.toString(),
    'fromDate': fromDate,
    'duration': duration.toString(),
  };

}
