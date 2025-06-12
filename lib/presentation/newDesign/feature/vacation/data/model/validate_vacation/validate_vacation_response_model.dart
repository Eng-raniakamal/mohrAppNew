class ValidateVacationResponseModel {
  bool? isValid;
  String? message;
  double? duration;
  double? overBalance;
  int? handlingId;

  ValidateVacationResponseModel(
      {this.isValid,
        this.message,
        this.duration,
        this.overBalance,
        this.handlingId});

  ValidateVacationResponseModel.fromJson(Map<String, dynamic> json) {
    isValid = json['IsValid'];
    message = json['Message'];
    duration = json['Duration'];
    overBalance = json['OverBalance'];
    handlingId = json['HandlingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsValid'] = isValid;
    data['Message'] = message;
    data['Duration'] = duration;
    data['OverBalance'] = overBalance;
    data['HandlingId'] = handlingId;
    return data;
  }
}
