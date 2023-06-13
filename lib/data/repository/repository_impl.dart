import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/data/data_source/remote_data_source.dart';
import 'package:mohr_hr/data/networks/error_handler.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/networks/network_info.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mohr_hr/data/mapper/mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/di.dart';
import '../response/responses.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;
  NetworkInfo _networkInfo;
  SharedPreferences _sharedPreferences;
  AppPreferences _appPreferences = instance <AppPreferences>();

  RepositoryImpl(this._remoteDataSource, this._localDataSource,
      this._networkInfo, this._sharedPreferences);

  @override
  Future<Either<Failure, AuthenticationModel>> login(
      LoginRequest loginRequest) async {
    //CHECK if internet is active or not
    if (await _networkInfo.isConnected) {
      try {
        //it's connected to internet so its safe to call the API
        final response = await _remoteDataSource.login(loginRequest);
        //if (response.code != ApiInternalStatus.SUCCESS)
        String? TokenUserID = response.userdata?.UserId;
        if (TokenUserID != null) {
          Constants.token = TokenUserID;
          _appPreferences.setUserToken(TokenUserID);

          // return data (success)
          //save user data response to cache
          return Right(response.toDomain());
        } else {
          // return left
          return Left(Failure(response.code ?? ApiInternalStatus.FAILURE,
              response.status ?? ResponseMessage.DEFAULT));
          //return Left(Failure(409, "error message"));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure!));
      }
    } else {
      // return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      //return Left(Failure(501, "please check your internet connection"));
    }
  }

//---------------------------------------------------------
  @override
  Future<Either<Failure, EmployeeDataModel>> getUserData(
      UserRequest userRequest) async {
    try {
      if (userRequest.userId == null) {
        userRequest.userId = await _appPreferences.getUserToken();
      }
      // get from cache
      final response = await _remoteDataSource.getUserData(userRequest);
      // final response = await _localDataSource.getUserData();
      return Right(response.toDomain());
    } catch (cacheError) {
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getUserData(userRequest);

          if (response.userdata?.UserId.toString() != null) // success
              {
            _localDataSource.saveUserToCache(response);
            return Right(response.toDomain());
          } else {
            // return left
            return Left(Failure(700, ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return (Left(ErrorHandler
              .handle(error)
              .failure!));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, EmployeeBasicDataModel>> getEmployeeBasicData(
      EmployeeBasicDataRequest empBDReq) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.getEmployeeBasicData(empBDReq);

        if (response.isValid == ApiInternalStatus.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          int status = 0;
          if (response.isValid == false) {
            status = 0;
          }
          return Left(Failure(status,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure!));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, EmployeeSkillsModel>> getEmployeeSkills(
      EmployeeSkillsRequest empSkillsReq) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.getEmployeeSkills(
            empSkillsReq);

        if (response.isValid == ApiInternalStatus.SUCCESS) // success
            {
          // return data (success)
          // return right
          return Right(response.toDomain());
        } else {
          // return biz logic error
          // return left
          int status = 0;
          if (response.isValid == false) {
            status = 0;
          }
          return Left(Failure(status,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler
            .handle(error)
            .failure!));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure,VacationsObject>> getVacations(VacationRequest vacationReq)
    async {
      try {
        if (vacationReq.UserId == null) {
          vacationReq.UserId = await _appPreferences.getUserToken();
        }
    final response = await _remoteDataSource.getVacations(vacationReq);
    return Right(response.toDomain());
  } catch (cacheError) {
    // we have cache error so we should call API

    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.getVacations(vacationReq);
        if (response.data != null) // success
            {
          //_localDataSource.saveUserToCache( );
          return Right(response.toDomain());
        } else {
          // return left
          return Left(Failure(700, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure!));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
  }




//  @override
// Future<Either<Failure, VactionsModel>> getVacations(VacationRequest vacationRequest)
//  async {
//   try {
//     if(vacationRequest.UserId == null)
//     {
//       vacationRequest.UserId= await _appPreferences.getUserToken() ;
//     }
//     // get from cache
//     final response = await _remoteDataSource.getEmployeeVacations(vacationRequest);
//     return Right(response.toDomain());
//   } catch (cacheError) {
//     // we have cache error so we should call API
//
//     if (await _networkInfo.isConnected) {
//       try {
//         // its safe to call the API
//         final response = await _remoteDataSource.getEmployeeVacations(vacationRequest);
//
//         // if (response.userdata?.UserId.toString() !=null) // success
//         //     {
//         //  _localDataSource.saveUserToCache(response);
//           return Right(response.toDomain());
//     //    } else {
//
//           // return left
//           return Left(Failure(700, ResponseMessage.DEFAULT));
//      //   }
//       } catch (error) {
//         return (Left(ErrorHandler.handle(error).failure!));
//       }
//     } else {
//       // return connection error
//       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
//     }
//   }
// }
// }

