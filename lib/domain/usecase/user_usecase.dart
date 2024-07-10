
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../application/app_prefs.dart';
import '../../application/di.dart';

class UserUseCase implements BaseUseCase<UserUseCaseInput,EmployeeDataModel> {

   final Repository _repository;
   final  AppPreferences _appPreferences= instance <AppPreferences>();

  UserUseCase(this._repository);


  @override
  Future<Either<Failure, EmployeeDataModel>> execute(
      UserUseCaseInput input) async {
    if(input.userId==null)
      {
        String userid= await _appPreferences.getUserToken() ;
        return await _repository.getUserData(UserRequest(
            userid));

      }
    else {
      return await _repository.getUserData(UserRequest(
          input.userId));
    }
  }
}

class UserUseCaseInput {
  String userId;
  UserUseCaseInput(this.userId);
}


