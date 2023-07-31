//


import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class displaySkillsUseCase implements BaseUseCase<displaySkillsInput ,getEmpSkillsModel> {

  final Repository _repository;

  displaySkillsUseCase (this._repository);
  @override
  Future<Either<Failure,getEmpSkillsModel>> execute(
      displaySkillsInput input,) async {
    return await _repository.displayEmployeeSkills (displaySkillsRequest(input.userId, input.empId));
  }
}

class displaySkillsInput {
  String userId;
  int empId;
  displaySkillsInput(this.userId,this.empId);
}
