//
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';



class SalaryUseCase implements BaseUseCase<SalaryUseCaseInput ,SalaryObject> {

  final Repository _repository;

  SalaryUseCase(this._repository);
  @override
  Future<Either<Failure, SalaryObject>> execute(
      SalaryUseCaseInput input) async {
    return await _repository.getSalary(SalaryRequest(
        input.userId));
  }
}

class SalaryUseCaseInput {
  String userId;
  SalaryUseCaseInput(this.userId);
}
