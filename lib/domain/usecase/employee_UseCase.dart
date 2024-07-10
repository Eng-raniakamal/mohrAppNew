
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class EmployeeUseCase implements BaseUseCase<EmployeeUseCaseInput ,EmployeeDataModel> {

  final Repository _repository;

  EmployeeUseCase(this._repository);


  @override
  Future<Either<Failure, EmployeeDataModel>> execute(
      EmployeeUseCaseInput input) async {
    return await _repository.getUserData(UserRequest(
        input.userId));
  }
}

class EmployeeUseCaseInput {
  String userId;
   //String userId=Constants.token;
  EmployeeUseCaseInput(this.userId);
}

