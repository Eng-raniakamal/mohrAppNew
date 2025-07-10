import 'package:essmohr/presentation/newDesign/core/model/reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:equatable/equatable.dart';

class StatusModel extends Equatable {
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final bool? isRejected; //مرفوض
  final String? name;

  const StatusModel({
    this.isCertified,
    this.isUnderReview,
    this.isRejected,
    this.name,
  });

  factory StatusModel.employeeVacationsModel(
      {required GetEmployeeVacationsModel employeeVacationsModel}) {
    return StatusModel(
      isCertified: employeeVacationsModel.isCertified,
      isUnderReview: employeeVacationsModel.isUnderReview,
      isRejected: employeeVacationsModel.isRejected,
      name: employeeVacationsModel.typeName,
    );

  }
  factory StatusModel.reviewerModel(
      {required ReviewerModel  model}) {
    return StatusModel(
      isCertified: model.isCertified,
      isUnderReview: model.isUnderReview,
      isRejected: model.isRejected,
    );

  }
  @override
  List<Object?> get props => [isCertified, isUnderReview, isRejected, name];


}