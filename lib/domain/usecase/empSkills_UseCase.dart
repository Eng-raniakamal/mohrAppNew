
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class EmployeeSkillsUseCase implements BaseUseCase<EmployeeSkillsUseCaseInput, EmployeeSkillsModel> {

  final Repository _repository;
  EmployeeSkillsUseCase(this._repository);

  @override
  Future<Either<Failure, EmployeeSkillsModel>> execute(
      EmployeeSkillsUseCaseInput input) async {
    return await _repository.getEmployeeSkills(EmployeeSkillsRequest(
        input.userId,input.date,input.gradeId,input.qualificationTypeId,input.employeeId));
  }
}
//  "GradeId": 2,
//   "QualificationTypeId": 1,
//   "EmployeeId
class EmployeeSkillsUseCaseInput {
  String userId="b64f7a02-b625-46b7-8126-d3a20defdff8";
  String date;
  int gradeId;
  int qualificationTypeId;
  int employeeId;
  EmployeeSkillsUseCaseInput(this.userId, this.date,this.gradeId,
                             this.qualificationTypeId,this.employeeId);
}
