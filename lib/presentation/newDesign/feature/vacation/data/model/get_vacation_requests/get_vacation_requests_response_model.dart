import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_requests/reviewers_model.dart';
import 'balance_model.dart';

class GetVacationRequestsResponseModel {
  String? requestDate;
  int? id;
  String? employeeName;
  String? employeeCode;
  String? department;
  String? jobTitle;
  String? fromDate;
  String? toDate;
  double? duration;
  String? attachments;
  BalanceModel? balance;
  String? vacationTypeName;
  String? replacementName;
  int? requestedId;
  bool? editable;
  String? status;
  List<ReviewersModel>? reviewers;

  GetVacationRequestsResponseModel(
      {this.requestDate,
        this.id,
        this.employeeName,
        this.employeeCode,
        this.department,
        this.jobTitle,
        this.fromDate,
        this.toDate,
        this.duration,
        this.attachments,
        this.balance,
        this.vacationTypeName,
        this.replacementName,
        this.requestedId,
        this.editable,
        this.status,
        this.reviewers});

  GetVacationRequestsResponseModel.fromJson(Map<String, dynamic> json) {
    requestDate = json['RequestDate'];
    id = json['Id'];
    employeeName = json['EmployeeName'];
    employeeCode = json['EmployeeCode'];
    department = json['Department'];
    jobTitle = json['JobTitle'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    duration = json['Duration'];
    attachments = json['Attachments'];
    balance =
    json['Balance'] != null ? BalanceModel.fromJson(json['Balance']) : null;
    vacationTypeName = json['VacationTypeName'];
    replacementName = json['ReplacementName'];
    requestedId = json['RequestedId'];
    editable = json['Editable'];
    status = json['Status'];
    if (json['Reviewers'] != null) {
      reviewers = <ReviewersModel>[];
      json['Reviewers'].forEach((v) {
        reviewers!.add(ReviewersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RequestDate'] = requestDate;
    data['Id'] = id;
    data['EmployeeName'] = employeeName;
    data['EmployeeCode'] = employeeCode;
    data['Department'] = department;
    data['JobTitle'] = jobTitle;
    data['FromDate'] = fromDate;
    data['ToDate'] = toDate;
    data['Duration'] = duration;
    data['Attachments'] = attachments;
    if (balance != null) {
      data['Balance'] = balance!.toJson();
    }
    data['VacationTypeName'] = vacationTypeName;
    data['ReplacementName'] = replacementName;
    data['RequestedId'] = requestedId;
    data['Editable'] = editable;
    data['Status'] = status;
    if (reviewers != null) {
      data['Reviewers'] = reviewers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


