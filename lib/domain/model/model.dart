
import 'package:mohr_hr/domain/usecase/user_usecase.dart';

import '../../data/response/responses.dart';

class DeviceInfo {
  String name;
  String identifier;
  String version;
  DeviceInfo(this.name, this.identifier, this.version);
}

class UserDataModel
{
   String UserId;
   String UserName;
   String Device;
   String TenantName;
   int EmployeeId;
   String EmployeeCode;
   String FullName;
   String ArabicName;
   String EnglishName;
   String CompanyLogo;
   String CompanyName;
   String FacePersonGroupId;
   String FacePersonId;
   String RecognitionModel;
   Map<String,dynamic>? masterImage;
   int ImageVerificationMode;
   int LocationVerificationMode;
   bool SupportGroupAttendance;
   UserDataModel(this.UserId, this.UserName, this.Device, this.EmployeeId,this.TenantName,
   this.EmployeeCode, this.FullName,
   this.ArabicName, this.EnglishName, this.CompanyLogo, this.CompanyName,
   this.FacePersonGroupId, this.FacePersonId,
   this.RecognitionModel,
   this.masterImage,
   this.ImageVerificationMode,
   this.LocationVerificationMode,
   this.SupportGroupAttendance)  ;
}

class RequestModel
{
  String url;
  String method;
  Map<String,dynamic>? headers;
  BodyModel? body;
  RequestModel(this. url,this.method,this.headers,this.body);
}

class BodyModel
{
  String email;
  String password;
  String deviceId;
  BodyModel(this.email,this.password,this.deviceId);
}

class AuthenticationModel
{
  RequestModel requestModel;
  UserDataModel userDataModel;
  AuthenticationModel(
      this.requestModel,
       this.userDataModel);
}

class EmployeeDataModel
{
  UserDataModel userDataModel;
  EmployeeDataModel(this.userDataModel);
}

class EmployeeBasicDataModel
{
  String? userId;
  EmployeeModel? employee;
  AddressModel? address;
  EmployeeBasicDataModel(this.userId,this.employee,this.address);
}
class EmployeeModel {
  String? arabicName ;
  String? englishName;
  String? birthDate;
  String? nationalId;
  String? socialId;
  String? email;
  String? phone;
  String? emergency_Number;

  EmployeeModel(this.arabicName,this.englishName,this.birthDate,this.nationalId,this.socialId,this.email,this.phone,this.emergency_Number);
}

class AddressModel {
  String? addressText ;
  int? districtId;
  String? poBox;
  String? zipCode;
  AddressModel(this.addressText,this.districtId,this.poBox,this.zipCode);
}



//  "Date": "2006",
//   "GradeId": 2,
//   "QualificationTypeId": 1,
//   "EmployeeId": 1
class EmployeeSkillsModel
{
  String userId;
  String date;
  int gradeId;
  int qualificationTypeId;
  int employeeId;
  EmployeeSkillsModel(this.userId,this.date,this.gradeId,this.qualificationTypeId,this.employeeId);
}

// "employeeName": "منه خالد فتحى",
// "employeeId": 13397,
// "employeeCode": "1002",
// "JobTitle": "مدير الدعم الفنى",
// "VacationTypeName": "اجازة test",
// "VacationTypeId": 1421,
// "VacationTypeDuration": 10.0,
// "Transferred": 0.0,
// "Total": 27.17,
// "Consumed": 0.0,
// "Pending": 0.0,
// "PostConsumed": 0.0,
// "Available": 27.17,
// "TotalView": 27.17,
// "Type": 2,
// "IsAnnual": true,
// "HideBalance": true

class Vacation
{
  String employeeName;
  int employeeId;
  String employeeCode;
  String vacationTypeName;
  double vacationTypeDuration;
  double transferred;
  double total;
  double consumed;
  double available;
  double pending;
  Vacation(this.employeeName,this.employeeId,this.employeeCode,this.vacationTypeName,this.vacationTypeDuration,
      this.transferred,this.total,this.consumed,this.available,this.pending);
}

  class  VacationsData
  {
    List<Vacation> vactions;
    VacationsData(this.vactions);
   }

class VacationsObject
{
  VacationsData vacationsData;
  VacationsObject(this.vacationsData);
}

