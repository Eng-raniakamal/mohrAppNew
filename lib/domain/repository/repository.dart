import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:dartz/dartz.dart';
import 'package:mohr_hr/data/response/responses.dart';

import '../model/model.dart';
// creating repository(login request) for the data can be take it from the view model(presentation layer)
// to send it to network(domain layer) for firing request in backend side and waiting
// two type of data (Authentication),or failure class(error)
//Qualification
abstract class Repository
{
  //We created class Failure in Network folder
  Future<Either<Failure,AuthenticationModel>> login(LoginRequest loginRequest);// Future<Either<Failure,Authentication>> register(RegisterRequest registerRequest);
  Future<Either<Failure,EmployeeDataModel>> getUserData(UserRequest userRequest);
  Future<Either<Failure,UserImageModel>> getUserImage(UserRequest userRequest);
  Future<Either<Failure,QualificationsObject>> getQualification(qualificationRequest userRequest);
  Future<Either<Failure,GradesObject>> getGrade(GradeRequest userRequest);
  Future<Either<Failure,BasicDataModel>>displayEmployeeBasicData(BasicDataRequest getEmpBDReq);
  Future<Either<Failure,EmployeeSaveBasicDataModel>> saveEmployeeBasicData(EmployeeBasicDataRequest empBDReq);
  Future<Either<Failure,SaveEmpSkillsModel>> saveEmployeeSkills(EmployeeSkillsRequest empSkillsReq);
  Future<Either<Failure,getEmpSkillsModel>> displayEmployeeSkills(displaySkillsRequest empSkillsReq);
  Future<Either<Failure,SaveAcademicDegreeModel>> saveAcademicDegree(SaveAcademicDegreeRequest empAcademicDegreeReq);
  Future<Either<Failure,getAcademicDegreeModel>> getAcademicDegree(displayAcademicDegreeRequest empAcademicDegreeReq);
  Future<Either<Failure,VacationsObject>> getVacations(VacationRequest vacationReq);
  Future<Either<Failure,VacationTypeObject>> getVacationType();
  Future<Either<Failure,SalaryObject>> getSalary(SalaryRequest salaryReq);
  Future<Either<Failure,SalaryDetailsObject>> getSalaryDetails(SalaryDetailsRequest salaryDetailsReq);
  Future<Either<Failure,AttendanceObject>> getAttendance(AttendanceRequest attendanceReq);

}