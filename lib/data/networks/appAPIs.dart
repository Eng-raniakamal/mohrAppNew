


import 'package:dio/dio.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/application/constants.dart';
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

  @GET(Constants.vacationUrl)
  Future<VacationsResponse> getVacations
      (@Field("UserId") String userId);

  @GET(Constants.salaryUrl)
  Future<SalaryResponse> getSalary
      (@Field("UserId") String userId);

   //static const String salaryDetailsUrl =Constants.salaryDetailsUrl ;


  @GET(Constants.salaryDetailsUrl)
  Future<SalaryDetailsResponse> getSalaryDetails
  (@Field("UserId") String userId);


  @POST(Constants.SaveEmployeeBasicDataUrl)
  Future<EmployeeBasicDataResponse> SaveEmployeBasicData
      (@Field("UserId") String userId,
      @Field("Employee") Employee employee,
      @Field("Address") Address address,
      // @Field("ArabicName") String ArabicName,
      // @Field("EnglishName") String EnglishName,
      // @Field("BirthDate") String BirthDate,
      // @Field("NationalId") String NationalId,
      // @Field("SocialId") String SocialId,
      // @Field("Email") String Email,
      // @Field("Phone") String Phone,
      // @Field("EmergencyNumber") String EmergencyNumber,
      // @Field("AddressText") String AddressText,
      // @Field("DistrictId") int DistrictId,
      // @Field("PoBox") String PoBox,
      // @Field("ZipCode") String ZipCode,
      );



  @POST(Constants.SaveEmpSkillsUrl)
  Future<saveEmpSkillsResponse> saveEmployeeSkillResponse
      (@Field("UserId") String userId,
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

