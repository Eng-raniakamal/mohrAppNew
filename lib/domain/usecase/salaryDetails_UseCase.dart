//
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';



class SalaryDetailsUseCase implements BaseUseCase<SalaryDetailsUseCaseInput ,SalaryDetailsObject> {

  final Repository _repository;

  SalaryDetailsUseCase(this._repository);
  @override
  Future<Either<Failure, SalaryDetailsObject>> execute(
      SalaryDetailsUseCaseInput input) async {
    return await _repository.getSalaryDetails(SalaryDetailsRequest(input.userId));
  }
}

class SalaryDetailsUseCaseInput {
  String userId;
  SalaryDetailsUseCaseInput(this.userId);
}
