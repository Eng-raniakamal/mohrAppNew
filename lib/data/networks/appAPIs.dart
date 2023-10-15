


import 'package:dio/dio.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:retrofit/http.dart';

import '../request/request.dart';
part 'appAPIs.g.dart';


@RestApi(baseUrl:Constants.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl})= _AppServiceClient;
@POST(Constants.LoginUrl)
// هعمل  function login بتكلم APIوهترد عليا AuthenticationResponse
  Future<AuthenticationResponse>  login(
  @Field("UserName") String email,
  @Field("Password") String password,
  @Field("DeviceId") String deviceId
    );

  @GET(Constants.EmployeeUrl)
  Future<UserProfileResponse> getUserDataResponse(@Field("UserId") String userId);


  @GET(Constants.getImageUrl)
  Future<UserImageResponse> getUserImageResponse(@Field("UserId")String userId);

  @GET(Constants.DisplayEmployeeBasicData)
  Future<BasicDataResponse> DisplayBasicData
      (@Field("UserId") String? userId,
       @Field("Id") int? empId);




  @GET(Constants.GetEmpSkillsUrl)
  Future<GetEmpSkillsResponse> DisplaySkills
      (@Field("UserId") String? userId,
      @Field("Id") int? empId);


  @GET(Constants.GetEmpAcademicDegree)
  Future<GetAcademicDegreeResponse> DisplayAcademicDegree
      (@Field("UserId") String? userId,
      @Field("Id") int? empId);


  @GET(Constants.GetQualifications)
  Future<QualificationsResponse> getQualifications
      (@Field("UserId") String userId);

  @GET(Constants.GetGrades)
  Future<GradesResponse> getGrades
      (@Field("UserId") String userId);


  @GET(Constants.GetAcademic)
  Future<AcademicResponse> getAcademic
      (@Field("UserId") String userId);

  @GET(Constants.vacationUrl)
  Future<VacationsResponse> getVacations
      (@Field("UserId") String userId);

  @GET(Constants.vacationTypeUrl)
  Future<VacationTypeResponse> getVacationType();


  @GET(Constants.salaryUrl)
  Future<SalaryResponse> getSalary
      (@Field("UserId") String userId);

   //static const String salaryDetailsUrl =Constants.salaryDetailsUrl ;


  @GET(Constants.salaryDetailsUrl)
  Future<SalaryDetailsResponse> getSalaryDetails
  (@Field("UserId") String userId);


  @GET(Constants.AttendanceUrl)
  Future<AttendanceResponse> getAttendance
      (@Field("UserId") String userId);
  // 'https://mohrapi.azurewebsites.net/api/Attendance?fromDate='+Constants.attendanceFrom.toString()+
  // '&toDate='+Constants.attendanceTo.toString(),

  @POST(Constants.SaveEmployeeBasicDataUrl)
  Future<EmployeeBasicDataResponse> SaveEmployeBasicData(
      @Header("userId") String userId,
      @Field("Employee") EmployeeSaveResponse employee,
      @Field("Address") AddressSaveResponse address,

      );


  @POST(Constants.SaveEmpSkillsUrl)
  Future<saveEmpSkillsResponse> saveEmployeeSkillResponse
      (@Header("UserId") String userId,
      @Field("Date") String date,
      @Field("GradeId") int gradeId,
      @Field("QualificationTypeId") int qualificationTypeId,
      @Field("EmployeeId") int employeeId,
      );

  @POST(Constants.saveEmpAcademicDegree)
  Future<saveAcademicDegreeResponse> saveAcademicDegree
      (@Field("UserId") String userId,
      @Field("Id") int id,
      @Field("Major") String major,
      @Field("University") String university,
      @Field("Notes") String notes,
      @Field("EmployeeId") int employeeId,
      @Field("AcademicDegreeTypeId") int academicDegreeTypeId,
      @Field("GradeId") int gradeId,
      @Field("DegreeDate") String degreeDate

      );


}

