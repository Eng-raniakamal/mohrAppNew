class CheckHandledAlertsRequestModel {
  final int vacationTypeId;
  final String fromDate;
  final String toDate;
  final int duration;

  CheckHandledAlertsRequestModel({
    required this.vacationTypeId,
    required this.fromDate,
    required this.toDate,
    required this.duration,
  });

  Map<String, dynamic> toQueryParams() => {
    'vacationTypeId': vacationTypeId.toString(),
    'fromDate': fromDate,
    'toDate': toDate,
    'duration': duration.toString(),
  };
}