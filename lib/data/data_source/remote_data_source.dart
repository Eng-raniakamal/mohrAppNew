import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/functions.dart';
import 'package:essmohr/data/networks/appAPIs.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:essmohr/application/app_prefs.dart';

//creating remote data source to talk with app service client
// to call APIS
//EmployeeBasicDataRequest
abstract class RemoteDataSource {
  // login function get back the authentication response
  //to can be convert it to authentication object
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<UserProfileResponse> getUserData(UserRequest userRequest);
  Future<UserImageResponse> getUserImage(UserRequest userRequest);
  Future<QualificationsResponse> getQualification(qualificationRequest userRequest);
  Future<GradesResponse> getGrades(GradeRequest userRequest);
  Future<AcademicResponse> getAcademic(UserRequest userRequest);
  Future<EmployeeBasicDataResponse> saveBasicData(EmployeeBasicDataRequest  empBDRequest);
  Future<BasicDataResponse> getBasicData(BasicDataRequest  empBDRequest);
  Future<saveEmpSkillsResponse> saveEmployeeSkills(EmployeeSkillsRequest empSkillsRequest);
  Future<GetEmpSkillsResponse> getEmployeeSkills(displaySkillsRequest empSkillsRequest);
  Future<saveAcademicDegreeResponse> saveAcademicDegree(SaveAcademicDegreeRequest AcademicDegreeRequest);
  Future<GetAcademicDegreeResponse> getAcademicDegree(displayAcademicDegreeRequest  AcademicDegreeRequest);

  Future<VacationsResponse> getVacations(VacationRequest empVacationRequest);
  Future<VacationTypeResponse> getVacationType();
  Future<SalaryResponse> getSalary(SalaryRequest empSalaryRequest);
  Future<AttendanceResponse> getAttendance(AttendanceRequest empAttendanceRequest);
  Future<SalaryDetailsResponse> getSalaryDetails(SalaryDetailsRequest SalaryDetailsRequest);
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
  Future<BasicDataResponse> getBasicData(BasicDataRequest empBDRequest) async {
    int? empId=empBDRequest.empId;

    String? userId=empBDRequest.userId;
    return await _appServiceClient.DisplayBasicData(userId!,empId!);
  }

  @override
  Future<saveEmpSkillsResponse> saveEmployeeSkills (empSkillsRequest) async{
    String userId=empSkillsRequest.userId.toString();
    int? empId=empSkillsRequest.employeeId;
   // Id="b64f7a02-b625-46b7-8126-d3a20defdff8";
    return
      await _appServiceClient.saveEmployeeSkillResponse(
      userId,empSkillsRequest.date,
      empSkillsRequest.gradeId,empSkillsRequest.qualificationTypeId,empId);
  }

  @override
  Future<VacationsResponse> getVacations(VacationRequest empVacationRequest) async {
    String userId = empVacationRequest.UserId.toString();
    return await _appServiceClient.getVacations(userId);


  }
    @override
    Future<SalaryResponse> getSalary(SalaryRequest empSalaryRequest) async{
      String userId = empSalaryRequest.UserId.toString();
      return await _appServiceClient.getSalary(userId);
  }

  @override
  Future<SalaryDetailsResponse> getSalaryDetails(SalaryDetailsRequest SalaryDetailsRequest) async {
    String userId = SalaryDetailsRequest.userId.toString();
    return await _appServiceClient.getSalaryDetails(userId);
  }


  @override
  Future<AttendanceResponse> getAttendance(AttendanceRequest empattendanceRequest) async{
    String userId = empattendanceRequest.userId.toString();
    return await _appServiceClient.getAttendance(userId);
  }

  @override
  Future<EmployeeBasicDataResponse> saveBasicData(EmployeeBasicDataRequest empBDRequest)
    async {
      String Id=empBDRequest.userId.toString();
      return await _appServiceClient.SaveEmployeBasicData(
          Id,
          empBDRequest.employee,
          empBDRequest.address);

  }

  @override
  Future<QualificationsResponse> getQualification(qualificationRequest userRequest) {
    String userId = userRequest.userId.toString();
    return  _appServiceClient.getQualifications(userId);
  }

  @override
  Future<GradesResponse> getGrades(GradeRequest userRequest) {
    String userId = userRequest.userId.toString();
    return  _appServiceClient.getGrades(userId);
  }

  @override
  Future<GetEmpSkillsResponse> getEmployeeSkills(displaySkillsRequest empSkillsRequest) {
    int? empId=empSkillsRequest.empId;
    String? userId=empSkillsRequest.userId;
    return  _appServiceClient.DisplaySkills(userId,empId);
  }

  @override
  Future<GetAcademicDegreeResponse> getAcademicDegree(displayAcademicDegreeRequest AcademicDegreeRequest) {
    int? empId=AcademicDegreeRequest.empId;
    String? userId=AcademicDegreeRequest.userId;
    return  _appServiceClient.DisplayAcademicDegree(userId,empId);
  }

  @override
  Future<saveAcademicDegreeResponse> saveAcademicDegree(SaveAcademicDegreeRequest AcademicDegreeRequest)
    async {
      String Id=AcademicDegreeRequest.userId.toString();
      return await _appServiceClient.saveAcademicDegree(
          Id,
          AcademicDegreeRequest.id,
          AcademicDegreeRequest.major,
          AcademicDegreeRequest.university,
          AcademicDegreeRequest.notes,
          AcademicDegreeRequest.employeeId,
          AcademicDegreeRequest.academicDegreeTypeId,
          AcademicDegreeRequest.gradeId,
          AcademicDegreeRequest.date

      );
  }

  @override
  Future<VacationTypeResponse> getVacationType()
  async{
    return await _appServiceClient.getVacationType();
  }

  @override
  Future<UserImageResponse> getUserImage(UserRequest userRequest) async {
    String Id=userRequest.userId.toString();
    return await _appServiceClient.getUserImageResponse(Id);
  }

  @override
  Future<AcademicResponse> getAcademic(UserRequest userRequest) async{
    String userId = userRequest.userId.toString();
    return  _appServiceClient.getAcademic(userId);
  }



}