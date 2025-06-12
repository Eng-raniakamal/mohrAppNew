class DefaultReviewerModel {
  int? id;
  int? employeeId;
  String? name;
  String? code;
  String? picPath;
  int? order;
  bool? singleApprovalEnabled;
  bool? isCurrent;

  DefaultReviewerModel(
      {this.id,
        this.employeeId,
        this.name,
        this.code,
        this.picPath,
        this.order,
        this.singleApprovalEnabled,
        this.isCurrent});

  DefaultReviewerModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    employeeId = json['EmployeeId'];
    name = json['Name'];
    code = json['Code'];
    picPath = json['PicPath'];
    order = json['Order'];
    singleApprovalEnabled = json['SingleApprovalEnabled'];
    isCurrent = json['IsCurrent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['EmployeeId'] = employeeId;
    data['Name'] =name;
    data['Code'] = code;
    data['PicPath'] = picPath;
    data['Order'] =order;
    data['SingleApprovalEnabled'] = singleApprovalEnabled;
    data['IsCurrent'] = isCurrent;
    return data;
  }


  Map<String, dynamic> toJsonPostVacation() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeId'] = employeeId;
    data['name'] =name;
    data['code'] = code;
    return data;
  }

}
