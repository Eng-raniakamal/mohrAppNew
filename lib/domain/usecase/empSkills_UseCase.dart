
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class EmployeeSkillsUseCase implements BaseUseCase<EmployeeSkillsUseCaseInput, SaveEmpSkillsModel> {

  final Repository _repository;
  EmployeeSkillsUseCase(this._repository);

  @override
  Future<Either<Failure, SaveEmpSkillsModel>> execute(
      EmployeeSkillsUseCaseInput input) async {
    return await _repository.saveEmployeeSkills(
        EmployeeSkillsRequest(
        input.userId,
            input.date,
            input.gradeId,
            input.qualificationTypeId,
            input.employeeId));
  }
}

class EmployeeSkillsUseCaseInput {
  String userId;
  String date;
  int gradeId;
  int qualificationTypeId;
  int employeeId;
  EmployeeSkillsUseCaseInput(this.userId, this.date,this.gradeId,
                             this.qualificationTypeId,this.employeeId);
}
