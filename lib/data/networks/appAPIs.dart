


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

  @GET(Constants.vacationUrl)
  Future<VacationsResponse> getVacations
      (@Field("UserId") String userId);

  @POST(Constants.EmployeeBasicDataUrl)
  Future<EmployeeBasicDataResponse> getEmployeBasicDataResponse
      (@Field("UserId") String userId,
      @Field("ArabicName") String ArabicName,
      @Field("EnglishName") String EnglishName,
      @Field("BirthDate") String BirthDate,
      @Field("NationalId") String NationalId,
      @Field("SocialId") String SocialId,
      @Field("Email") String Email,
      @Field("Phone") String Phone,
      @Field("EmergencyNumber") String Emergency_Number,
      @Field("AddressText") String AddressText,
      @Field("DistrictId") int DistrictId,
      @Field("PoBox") String PoBox,
      @Field("ZipCode") String ZipCode,
      );

  @POST(Constants.EmployeeSkillsUrl)
  Future<EmployeeSkillsResponse> getEmployeeSkillResponse
      (@Field("UserId") String userId,
      @Field("Date") String date,
      @Field("GradeId") int gradeId,
      @Field("QualificationTypeId") int qualificationTypeId,
      @Field("EmployeeId") int employeeId,
      );


}

