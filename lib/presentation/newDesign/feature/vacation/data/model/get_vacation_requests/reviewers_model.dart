class ReviewersModel {
  String? name;
  String? status;
  String? note;

  ReviewersModel({this.name, this.status, this.note});

  ReviewersModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    status = json['Status'];
    note = json['Note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Status'] = status;
    data['Note'] = note;
    return data;
  }
}
