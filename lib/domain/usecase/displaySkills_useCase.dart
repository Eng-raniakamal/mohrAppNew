//


import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
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
