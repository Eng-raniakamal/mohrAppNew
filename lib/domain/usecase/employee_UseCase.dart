
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
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

