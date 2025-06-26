class GetEmployeeVacationsResponseModel {
  String? fromDate;
  String? toDate;
  double? duration;
  String? vacationTypeName;
  String? reviewerName;
  String? replacementName;
  int? actualDuration;
  bool? isCanceled;
  String? modifiedBy;

  GetEmployeeVacationsResponseModel(
      {this.fromDate,
        this.toDate,
        this.duration,
        this.vacationTypeName,
        this.reviewerName,
        this.replacementName,
        this.actualDuration,
        this.isCanceled,
        this.modifiedBy});

  GetEmployeeVacationsResponseModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    duration = json['Duration'];
    vacationTypeName = json['VacationTypeName'];
    reviewerName = json['ReviewerName'];
    replacementName = json['ReplacementName'];
    actualDuration = json['ActualDuration'];
    isCanceled = json['IsCanceled'];
    modifiedBy = json['ModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FromDate'] = fromDate;
    data['ToDate'] = toDate;
    data['Duration'] = duration;
    data['VacationTypeName'] = vacationTypeName;
    data['ReviewerName'] = reviewerName;
    data['ReplacementName'] = replacementName;
    data['ActualDuration'] = actualDuration;
    data['IsCanceled'] = isCanceled;
    data['ModifiedBy'] = modifiedBy;
    return data;
  }
}
