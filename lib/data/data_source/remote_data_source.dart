import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/functions.dart';
import 'package:mohr_hr/data/networks/appAPIs.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mohr_hr/application/app_prefs.dart';

//creating remote data source to talk with app service client
// to call APIS

abstract class RemoteDataSource {
  // login function get back the authentication response
  //to can be convert it to authentication object
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<UserProfileResponse> getUserData(UserRequest userRequest);
  Future<EmployeeBasicDataResponse> getEmployeeBasicData(EmployeeBasicDataRequest empBDRequest);
  Future<EmployeeSkillsResponse> getEmployeeSkills(EmployeeSkillsRequest empSkillsRequest);
  Future<VacationsResponse> getVacations(VacationRequest empVacationRequest);
}

// implementation class For class RemoteDataSource
class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {

    DeviceInfo deviceDetails = await getDeviceDetails();
    String device_id=deviceDetails.identifier;
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password,device_id);
  }
  @override
  Future<UserProfileResponse> getUserData(UserRequest userReq) async {
    String Id=userReq.userId.toString();
    return await _appServiceClient.getUserDataResponse(Id);
  }

  @override
  Future<EmployeeBasicDataResponse> getEmployeeBasicData(EmployeeBasicDataRequest empBDRequest) async {
    String Id=empBDRequest.userId.toString();

    // EmployeeRequest? employee= empBDRequest.employee;
    //AddressRequest? address= empBDRequest.address;
    return await _appServiceClient.getEmployeBasicDataResponse(
        Id,
        empBDRequest.ArabicName,empBDRequest.EnglishName,
        empBDRequest.BirthDate,empBDRequest.NationalId,
        empBDRequest.SocialId,empBDRequest.Email,
        empBDRequest.Phone,empBDRequest.Emergency_Number,
        empBDRequest.AddressText,empBDRequest.DistrictId,
        empBDRequest.PoBox,empBDRequest.ZipCode

    );
  }

  @override
  Future<EmployeeSkillsResponse> getEmployeeSkills (EmployeeSkillsRequest empSkillsRequest) async{
    String Id=empSkillsRequest.userId.toString();
   // Id="b64f7a02-b625-46b7-8126-d3a20defdff8";
    return
      await _appServiceClient.getEmployeeSkillResponse(
      Id,empSkillsRequest.date,empSkillsRequest.gradeId,
      empSkillsRequest.gradeId,empSkillsRequest.qualificationTypeId);
  }

  @override
  Future<VacationsResponse> getVacations(VacationRequest empVacationRequest) async{
    String userId=empVacationRequest.UserId.toString();
    return await _appServiceClient.getVacations(userId);
     // (empVacationRequest.UserId);

  }
}