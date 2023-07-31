
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
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
