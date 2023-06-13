import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:dartz/dartz.dart';
import 'package:mohr_hr/data/response/responses.dart';

import '../model/model.dart';
// creating repository(login request) for the data can be take it from the view model(presentation layer)
// to send it to network(domain layer) for firing request in backend side and waiting
// two type of data (Authentication),or failure class(error)

abstract class Repository
{

  //We created class Failure in Network folder

  Future<Either<Failure,AuthenticationModel>> login(LoginRequest loginRequest);// Future<Either<Failure,Authentication>> register(RegisterRequest registerRequest);
  Future<Either<Failure,EmployeeDataModel>> getUserData(UserRequest userRequest);
  Future<Either<Failure,EmployeeBasicDataModel>> getEmployeeBasicData(EmployeeBasicDataRequest empBDReq);
  Future<Either<Failure,EmployeeSkillsModel>> getEmployeeSkills(EmployeeSkillsRequest empSkillsReq);
  Future<Either<Failure,VacationsObject>> getVacations(VacationRequest vacationReq);

}