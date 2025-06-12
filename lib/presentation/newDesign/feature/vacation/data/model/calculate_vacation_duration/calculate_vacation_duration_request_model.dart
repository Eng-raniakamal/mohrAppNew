class CalculateVacationDurationRequestModel {
  final DateTime fromDate;
  final DateTime toDate;
  final int vacationTypeId;
  final int unit;
  final int? replacementId;

  CalculateVacationDurationRequestModel({
    required this.fromDate,
    required this.toDate,
    required this.vacationTypeId,
    required this.unit,
    this.replacementId,
  });

  factory CalculateVacationDurationRequestModel.fromJson(Map<String, dynamic> json) {
    return CalculateVacationDurationRequestModel(
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      vacationTypeId: json['vacationTypeId'],
      unit: json['unit'],
      replacementId: json['replacementId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'vacationTypeId': vacationTypeId,
      'unit': unit,
      'replacementId': replacementId,
    };
  }
}
