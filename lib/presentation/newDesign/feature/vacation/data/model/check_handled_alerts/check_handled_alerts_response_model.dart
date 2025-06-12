class CheckHandledAlertsResponseModel {
  final int count;
  final String message;

  CheckHandledAlertsResponseModel({
    required this.count,
    required this.message,
  });

  factory CheckHandledAlertsResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckHandledAlertsResponseModel(
      count: json['Count'] ?? 0,
      message: json['Message'] ?? '',
    );
  }
}