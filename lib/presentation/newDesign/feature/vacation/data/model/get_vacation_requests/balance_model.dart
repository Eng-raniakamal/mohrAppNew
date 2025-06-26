class BalanceModel {
  String? employeeName;
  int? employeeId;
  String? employeeCode;
  String? jobTitle;
  String? vacationTypeName;
  int? vacationTypeId;
  double? vacationTypeDuration;
  double? transferred;
  double? total;
  double? consumed;
  double? pending;
  double? postConsumed;
  double? available;
  double? totalView;
  double? settlemented;
  int? type;
  bool? isAnnual;
  bool? hideBalance;

  BalanceModel(
      {this.employeeName,
        this.employeeId,
        this.employeeCode,
        this.jobTitle,
        this.vacationTypeName,
        this.vacationTypeId,
        this.vacationTypeDuration,
        this.transferred,
        this.total,
        this.consumed,
        this.pending,
        this.postConsumed,
        this.available,
        this.totalView,
        this.settlemented,
        this.type,
        this.isAnnual,
        this.hideBalance});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    employeeName = json['employeeName'];
    employeeId = json['employeeId'];
    employeeCode = json['employeeCode'];
    jobTitle = json['JobTitle'];
    vacationTypeName = json['VacationTypeName'];
    vacationTypeId = json['VacationTypeId'];
    vacationTypeDuration = json['VacationTypeDuration'];
    transferred = json['Transferred'];
    total = json['Total'];
    consumed = json['Consumed'];
    pending = json['Pending'];
    postConsumed = json['PostConsumed'];
    available = json['Available'];
    totalView = json['TotalView'];
    settlemented = json['Settlemented'];
    type = json['Type'];
    isAnnual = json['IsAnnual'];
    hideBalance = json['HideBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeName'] = employeeName;
    data['employeeId'] = employeeId;
    data['employeeCode'] = employeeCode;
    data['JobTitle'] = jobTitle;
    data['VacationTypeName'] = vacationTypeName;
    data['VacationTypeId'] = vacationTypeId;
    data['VacationTypeDuration'] = vacationTypeDuration;
    data['Transferred'] = transferred;
    data['Total'] = total;
    data['Consumed'] = consumed;
    data['Pending'] = pending;
    data['PostConsumed'] = postConsumed;
    data['Available'] = available;
    data['TotalView'] = totalView;
    data['Settlemented'] = settlemented;
    data['Type'] = type;
    data['IsAnnual'] = isAnnual;
    data['HideBalance'] = hideBalance;
    return data;
  }
}
