class ValidateVacationRequestModel {
  final int vacationTypeId;
  final DateTime fromDate;
  final DateTime toDate;
  final double duration;
  final int? id;

  ValidateVacationRequestModel({
    required this.vacationTypeId,
    required this.fromDate,
    required this.toDate,
    required this.duration,
     this.id,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'vacationTypeId': vacationTypeId,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'id': id ?? 0, // Default to 0 if id is null
      'duration': duration,
    };
  }
}
