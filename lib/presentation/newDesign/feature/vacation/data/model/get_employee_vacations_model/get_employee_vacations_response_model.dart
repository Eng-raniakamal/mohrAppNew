import 'package:essmohr/domain/model/model.dart';

class GetEmployeeVacationsResponseModel {
  String? fromDate;
  String? toDate;
  double? duration;
  String? vacationTypeName;
  String? reviewerName;
  String? replacementName;
  int? actualDuration;
  bool? isCanceled;
  String? status;
  String? modifiedBy;
  List<RequestReviewers>? reviewers;

  GetEmployeeVacationsResponseModel(
      {this.fromDate,
        this.toDate,
        this.duration,
        this.vacationTypeName,
        this.reviewerName,
        this.replacementName,
        this.actualDuration,
        this.isCanceled,
        this.status,
        this.modifiedBy,
        this.reviewers
      });

  GetEmployeeVacationsResponseModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    duration = json['Duration'];
    vacationTypeName = json['VacationTypeName'];
    reviewerName = json['ReviewerName'];
    replacementName = json['ReplacementName'];
    actualDuration = json['ActualDuration'];
    isCanceled = json['IsCanceled'];
    status=json['Status'];
    modifiedBy = json['ModifiedBy'];
    //reviewers=json["Reviewers"];
    reviewers = (json["Reviewers"] as List<dynamic>?)
        ?.map((e) => RequestReviewers.fromJson(e as Map<String, dynamic>))
        .toList();
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
    data['Status'] = status;
    data['ModifiedBy'] = modifiedBy;
    data["Reviewers"] = reviewers?.map((e) => e.toJson()).toList();
    return data;
  }
}
