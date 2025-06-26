class ApproveCancelRequestModel{
  int id;
  bool isApproved;
  double value;

  ApproveCancelRequestModel({
    required this.id,
    required this.isApproved,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isApproved': isApproved,
      'value': value,
    };
  }



}