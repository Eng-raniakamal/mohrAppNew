//
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
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
