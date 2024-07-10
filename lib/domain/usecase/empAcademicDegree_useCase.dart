
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetAcademicDegreeUseCase implements
    BaseUseCase<getAcademicDegreeUseCaseInput, getAcademicDegreeModel> {

  final Repository _repository;
  GetAcademicDegreeUseCase(this._repository);

  @override
  Future<Either<Failure, getAcademicDegreeModel>> execute(
      getAcademicDegreeUseCaseInput input) async {
    return await _repository.getAcademicDegree(displayAcademicDegreeRequest(
        input.userId,input.employeeId));
  }
}

class getAcademicDegreeUseCaseInput {
  String userId;
  int employeeId;
  getAcademicDegreeUseCaseInput(this.userId,this.employeeId);
}
