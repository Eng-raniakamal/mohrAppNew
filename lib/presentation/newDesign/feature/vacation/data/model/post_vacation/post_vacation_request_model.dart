import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';

class PostVacationRequestModel {
  int? vacationTypeId;
  String? fromDate;
  String? toDate;
  int? duration;
  String? notes;
  RequestModel? request;

  PostVacationRequestModel(
      {this.vacationTypeId,
        this.fromDate,
        this.toDate,
        this.duration,
        this.notes,
        this.request});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['vacationTypeId'] = vacationTypeId;
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['duration'] = duration;
    data['notes'] = notes;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    return data;
  }
}

class RequestModel {
  List<DefaultReviewerModel>? reviewers;

  RequestModel({this.reviewers});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (reviewers != null) {
      data['reviewers'] = reviewers!.map((v) => v.toJsonPostVacation()).toList();
    }
    return data;
  }



}

// PostVacationModel.fromJson(Map<String, dynamic> json) {
//   vacationTypeId = json['vacationTypeId'];
//   fromDate = json['fromDate'];
//   toDate = json['toDate'];
//   duration = json['duration'];
//   notes = json['notes'];
//   request =
//   json['request'] != null ?  RequestModel.fromJson(json['request']) : null;


// }
/*
  RequestModel.fromJson(Map<String, dynamic> json) {
    if (json['reviewers'] != null) {
      reviewers = <DefaultReviewerModel>[];
      json['reviewers'].forEach((v) {
        reviewers!.add( DefaultReviewerModel.fromJson(v));
      });
    }
  }
 */