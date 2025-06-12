class CalculateVacationDurationResponseModel {
  final double? count;
  final double? days;
  final bool? replacementInVacation;
  final bool? isValid;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? message;

  CalculateVacationDurationResponseModel({
    this.count,
    this.days,
    this.replacementInVacation,
    this.isValid,
    this.fromDate,
    this.toDate,
    this.message,
  });

  factory CalculateVacationDurationResponseModel.fromJson(Map<String, dynamic> json) {
    return CalculateVacationDurationResponseModel(
      count: (json['Count'] as num?)?.toDouble(),
      days: (json['Days'] as num?)?.toDouble(),
      replacementInVacation: json['ReplacementInVacation'] as bool?,
      isValid: json['IsValid'] as bool?,
      fromDate: json['FromDate'] != null ? DateTime.tryParse(json['FromDate']) : null,
      toDate: json['ToDate'] != null ? DateTime.tryParse(json['ToDate']) : null,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Count': count,
      'Days': days,
      'ReplacementInVacation': replacementInVacation,
      'IsValid': isValid,
      'FromDate': fromDate?.toIso8601String(),
      'ToDate': toDate?.toIso8601String(),
      'Message': message,
    };
  }
}
