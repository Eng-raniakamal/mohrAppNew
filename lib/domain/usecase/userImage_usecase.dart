
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../application/app_prefs.dart';
import '../../application/di.dart';

class UserImageUseCase implements BaseUseCase<UserImageUseCaseInput,UserImageModel> {

  final Repository _repository;
  final  AppPreferences _appPreferences= instance <AppPreferences>();
  UserImageUseCase(this._repository);
  @override
  Future<Either<Failure, UserImageModel>> execute(
      UserImageUseCaseInput input) async {
    if(input.userId ==null)
    {
      String userid= await _appPreferences.getUserToken() ;
      return await _repository.getUserImage(UserRequest(
          userid));
    }
    else {
      return await _repository.getUserImage(UserRequest(
          input.userId));
    }
  }
}

class UserImageUseCaseInput {
  String userId;
  UserImageUseCaseInput(this.userId);
}


