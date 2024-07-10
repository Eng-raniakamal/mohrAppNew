
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, AuthenticationModel> {

  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationModel>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(
        input.email, input.password,input.deviceId));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  String deviceId;
  LoginUseCaseInput(this.email, this.password,this.deviceId);
}
