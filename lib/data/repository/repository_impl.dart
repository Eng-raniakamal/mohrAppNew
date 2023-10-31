
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/data/data_source/remote_data_source.dart';
import 'package:mohr_hr/data/networks/error_handler.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/networks/network_info.dart';
import 'package:mohr_hr/data/request/request.dart';
//import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mohr_hr/data/mapper/mapper.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../../application/di.dart';


class RepositoryImpl extends Repository {
 final RemoteDataSource _remoteDataSource;
 final  LocalDataSource _localDataSource;
 final  NetworkInfo _networkInfo;
 final  AppPreferences _appPreferences = instance <AppPreferences>();

  RepositoryImpl(this._remoteDataSource, this._localDataSource,
      this._networkInfo);

  @override
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest)
  async {
    //CHECK if internet is active or not
    if (await _networkInfo.isConnected) {
      try {
        //it's connected to internet so its safe to call the API
        final response = await _remoteDataSource.login(loginRequest);
        //if (response.code != ApiInternalStatus.SUCCESS)

        //if (TokenUserID != null )

        // if( response.code==ApiInternalStatus.SUCCESS) {
        String? TokenUserID = response.userdata?.UserId;
        int? TokenEmpId = response.userdata?.EmployeeId;
        if (TokenUserID != null) {
          Constants.token = TokenUserID;
          _appPreferences.setUserToken(TokenUserID);
          _appPreferences.setEmpIdToken(TokenEmpId);
          return Right(response.toDomain());
        }
        // return data (success)
        //save user data response to cache


            else {
          // return left

          return Left(Failure(response.code ?? ApiInternalStatus.FAILURE!,
              response.status ?? ResponseMessage.DEFAULT));
          TokenUserID="";
          //return Left(Failure(409, "error message"));
        }
      } catch (error) {

        return (Left(ErrorHandler
            .handle(error)
            .failure));
        //return Left(Failure(401, "error message"));
      }
    } else {
      // return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      //return Left(Failure(501, "please check your internet connection"));
    }
  }
//---------------------------------------------------------
  @override
  Future<Either<Failure, EmployeeDataModel>> getUserData(UserRequest userRequest)
  async {
    try {
      if (userRequest.userId == null) {

        userRequest.userId = await _appPreferences.getUserToken();

      }
      // get from cache

      final response = await _remoteDataSource.getUserData(userRequest);
      //final response2 = await _localDataSource.getUserData();
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
              .failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////
  //@override
  // Future<Either<Failure, EmployeeBasicDataModel>> getEmployeeBasicData(
  //     EmployeeBasicDataRequest empBDReq) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       // its safe to call the API
  //       final response = await _remoteDataSource.getEmployeeBasicData(empBDReq);
  //
  //       if (response.isValid == ApiInternalStatus.SUCCESS) // success
  //           {
  //         // return data (success)
  //         // return right
  //         return Right(response.toDomain());
  //       } else {
  //         // return biz logic error
  //         // return left
  //         int status = 0;
  //         if (response.isValid == false) {
  //           status = 0;
  //         }
  //         return Left(Failure(status,
  //             response.message ?? ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       return (Left(ErrorHandler
  //           .handle(error)
  //           .failure!));
  //     }
  //   } else {
  //     // return connection error
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  @override
  Future<Either<Failure, BasicDataModel>> displayEmployeeBasicData(BasicDataRequest getEmpBDReq)
  async {
    try {
      if (getEmpBDReq.userId == null) {
        getEmpBDReq.userId = await _appPreferences.getUserToken();
      }
      if ( getEmpBDReq.empId == 0) {
        getEmpBDReq.empId = await _appPreferences.getEmpIdToken();
      }

      final response = await _remoteDataSource.getBasicData(getEmpBDReq);
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getBasicData(getEmpBDReq);
          if (response.employeeData?.empId == getEmpBDReq.empId ) // success
              {
            // _localDataSource.saveUserToCache(response);

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

  @override
  Future<Either<Failure, SaveEmpSkillsModel>> saveEmployeeSkills(
  EmployeeSkillsRequest empSkillsReq)
  async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.saveEmployeeSkills(
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
            .failure));
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
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
  @override
  Future<Either<Failure,SalaryObject>> getSalary(SalaryRequest salaryReq)
  async {
  try {
    if (salaryReq.UserId == null) {
      salaryReq.UserId = await _appPreferences.getUserToken();
    }
    final response = await _remoteDataSource.getSalary(salaryReq);
    return Right(response.toDomain());
  } catch (cacheError) {
    // we have cache error so we should call API

    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.getSalary(salaryReq);
        if (response.data != null) // success
            {
          //_localDataSource.saveUserToCache( );
          return Right(response.toDomain());
        } else {
          // return left
          return Left(Failure(700, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
  @override
  Future<Either<Failure, SalaryDetailsObject>> getSalaryDetails(SalaryDetailsRequest salaryDetailsReq)
  async {
    try {
      if (salaryDetailsReq.userId == null) {
        salaryDetailsReq.userId = await _appPreferences.getUserToken();
      }
      final response = await _remoteDataSource.getSalaryDetails(salaryDetailsReq);
      return Right(response.toDomain());
    } catch (cacheError) {
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getSalaryDetails(salaryDetailsReq);
          if (response.netSalary != null) // success
              {
            //_localDataSource.saveUserToCache( );
            return Right(response.toDomain());
          } else {
            // return left
            return Left(Failure(700, ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return (Left(ErrorHandler.handle(error).failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, EmployeeSaveBasicDataModel>> saveEmployeeBasicData(EmployeeBasicDataRequest empBDReq)
    async {
      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.saveBasicData(empBDReq);

          if (response.isValid == ApiInternalStatus.SUCCESS) // success
              {
            // return data (success)
            // return right
            return Right(response.toDomain());
          } else {
            // return big logic error
            // return left
           int status = 0;
            if (response.isValid == false) {
             status = 0;
            }
            return Left(Failure(status,
                response.message!));
          }
        } catch (error) {
          return (Left(ErrorHandler
              .handle(error)
              .failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
  }

  @override
  Future<Either<Failure, getEmpSkillsModel>> displayEmployeeSkills(displaySkillsRequest empSkillsReq)
    async {
      try {
        if (empSkillsReq.userId == null) {
          empSkillsReq.userId = await _appPreferences.getUserToken();
        }
        if ( empSkillsReq.empId == 0) {
          empSkillsReq.empId = await _appPreferences.getEmpIdToken();
        }

        final response = await _remoteDataSource.getEmployeeSkills(empSkillsReq);
        return Right(response.toDomain());
      } catch (cacheError) {
        if (await _networkInfo.isConnected) {
          try {
            // its safe to call the API
            final response = await _remoteDataSource.getEmployeeSkills(empSkillsReq);
            // success

              // _localDataSource.saveUserToCache(response);

              return Right(response.toDomain());

          } catch (error) {
            return (Left(ErrorHandler.handle(error).failure));
          }
        } else {
          // return connection error
          return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
        }
      }
  }

  @override
  Future<Either<Failure, QualificationsObject>> getQualification(qualificationRequest userRequest)
    async {
      try {
        if (userRequest.userId == null) {

          userRequest.userId = await _appPreferences.getUserToken();

        }
        // get from cache

        final response = await _remoteDataSource.getQualification(userRequest);
        return Right(response.toDomain());
      } catch (cacheError) {
        if (await _networkInfo.isConnected) {
          try {
            // its safe to call the API
            final response = await _remoteDataSource.getQualification(userRequest);
               return Right(response.toDomain());
          } catch (error) {
            return (Left(ErrorHandler
                .handle(error)
                .failure));
          }
        } else {
          // return connection error
          return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
        }
      }
    }

  @override
  Future<Either<Failure, GradesObject>> getGrade(GradeRequest userRequest)
  async {
    try {
      if (userRequest.userId == null) {

        userRequest.userId = await _appPreferences.getUserToken();

      }
      // get from cache
      final response = await _remoteDataSource.getGrades(userRequest);
      return Right(response.toDomain());
    } catch (cacheError) {
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getGrades(userRequest);
          return Right(response.toDomain());
        } catch (error) {
          return (Left(ErrorHandler
              .handle(error)
              .failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }


  @override
  Future<Either<Failure, DegreeObject>> getDegree(UserRequest userRequest)
  async {
    try {
      if (userRequest.userId == null) {

        userRequest.userId = await _appPreferences.getUserToken();

      }
      // get from cache
      final response = await _remoteDataSource.getAcademic(userRequest);
      return Right(response.toDomain());
    } catch (cacheError) {
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getAcademic(userRequest);
          return Right(response.toDomain());
        } catch (error) {
          return (Left(ErrorHandler
              .handle(error)
              .failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }



  @override
  Future<Either<Failure, SaveAcademicDegreeModel>>
  saveAcademicDegree(SaveAcademicDegreeRequest empAcademicDegreeReq)
  // async {
  //
  //
  //
  //   try {
  //     if (empAcademicDegreeReq.userId == null) {
  //       empAcademicDegreeReq.userId = await _appPreferences.getUserToken();
  //     }
  //     if ( empAcademicDegreeReq.employeeId == 0) {
  //       empAcademicDegreeReq.employeeId  = await _appPreferences.getEmpIdToken();
  //     }
  //
  //     final response = await _remoteDataSource.saveAcademicDegree(empAcademicDegreeReq);
  //     return Right(response.toDomain());
  //   } catch (cacheError) {
  //     if (await _networkInfo.isConnected) {
  //       try {
  //         // its safe to call the API
  //         final response = await _remoteDataSource.saveAcademicDegree(empAcademicDegreeReq);
  //         // success
  //
  //         // _localDataSource.saveUserToCache(response);
  //
  //         return Right(response.toDomain());
  //
  //       } catch (error) {
  //         return (Left(ErrorHandler.handle(error).failure!));
  //       }
  //     } else {
  //       // return connection error
  //       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //     }
  //   }
  // }
  async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.saveAcademicDegree(
            empAcademicDegreeReq);

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
            .failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, getAcademicDegreeModel>>
  getAcademicDegree(displayAcademicDegreeRequest empAcademicDegreeReq)
  async {
    try {
      if (empAcademicDegreeReq.userId == null) {
        empAcademicDegreeReq.userId = await _appPreferences.getUserToken();
      }
      if ( empAcademicDegreeReq.empId == 0) {
        empAcademicDegreeReq.empId = await _appPreferences.getEmpIdToken();
      }

      final response = await _remoteDataSource.getAcademicDegree(empAcademicDegreeReq);
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getAcademicDegree(empAcademicDegreeReq);
          // success

          // _localDataSource.saveUserToCache(response);

          return Right(response.toDomain());

        } catch (error) {
          return (Left(ErrorHandler.handle(error).failure!));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, VacationTypeObject>> getVacationType() async{


      // get from cache
      final response = await _remoteDataSource.getVacationType();
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getVacationType();
          return Right(response.toDomain());
        } catch (error) {
          return (Left(ErrorHandler
              .handle(error)
              .failure));
        }
      } else {
        // return connection error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }

  // @override
  // Future<Either<Failure, AttendanceObject>> getAttendance(AttendanceRequest attendanceReq)
  // async {
  //   try {
  //     if (attendanceReq.userId == null) {
  //       attendanceReq.userId = await _appPreferences.getUserToken();
  //     }
  //     final response = await _remoteDataSource.getAttendance(attendanceReq);
  //     return Right(response.toDomain());
  //   } catch (cacheError) {
  //     // we have cache error so we should call API
  //
  //     if (await _networkInfo.isConnected) {
  //       try {
  //         // its safe to call the API
  //         final response = await _remoteDataSource.getAttendance(attendanceReq);
  //         if (response.attendance!.isNotEmpty) // success
  //             {
  //           //_localDataSource.saveUserToCache( );
  //           return Right(response.toDomain());
  //         } else {
  //           // return left
  //           return Left(Failure(700, ResponseMessage.DEFAULT));
  //         }
  //       } catch (error) {
  //         return (Left(ErrorHandler.handle(error).failure!));
  //       }
  //     } else {
  //       // return connection error
  //       return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //     }
  //   }
  // }

  @override
  Future<Either<Failure, UserImageModel>> getUserImage(UserRequest userRequest)
    async {
      try {
        if (userRequest.userId == null) {

          userRequest.userId = await _appPreferences.getUserToken();

        }
        // get from cache

        final response = await _remoteDataSource.getUserImage(userRequest);
        //final response2 = await _localDataSource.getUserData();
        return Right(response.toDomain());
      } catch (cacheError) {
        // we have cache error so we should call API

        if (await _networkInfo.isConnected) {
          try {
            // its safe to call the API
            final response = await _remoteDataSource.getUserImage(userRequest);

            if (response.data?.toString() != null) // success
                {
             // _localDataSource.saveUserToCache(response);
              return Right(response.toDomain());
            } else {
              // return left
              return Left(Failure(700, ResponseMessage.DEFAULT));
            }
          } catch (error) {
            return (Left(ErrorHandler
                .handle(error)
                .failure));
          }
        } else {
          // return connection error
          return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
        }
      }
    }

  @override
  Future<Either<Failure, AttendanceObject>> getAttendance(AttendanceRequest attendanceReq) {
    // TODO: implement getAttendance
    throw UnimplementedError();
  }
  }











