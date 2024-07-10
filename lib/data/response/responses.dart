
import 'package:json_annotation/json_annotation.dart';
import 'package:essmohr/domain/model/model.dart';
import '../../domain/model/model.dart';

part 'responses.g.dart';


enum MohrHttpMethod { GET, POST, DELETE, PUT }

// to auto creation for json file should be use json annotation

@JsonSerializable(explicitToJson: true)
class BaseResponse{
  @JsonKey(name: "code")
   int ? code;
  @JsonKey(name: "status")
  String?  status;
}
//-------------------------------------------------------------------------------
@JsonSerializable(explicitToJson: true)// do combination between from json to json
class BodyResponse{
  @JsonKey(name:"UserName")
  String? email;
  @JsonKey(name:"Password")
  String? password;
  @JsonKey(name:"DeviceId")
  String? deviceId;
  BodyResponse(this.email,this.password,this.deviceId);
  //from json
  factory BodyResponse.fromJson(Map<String,dynamic>json)=>
      _$BodyResponseFromJson(json);
  //to json
  Map<String,dynamic> toJson() => _$BodyResponseToJson(this);
}
//------------------------------------------------------------------------------
@JsonSerializable(explicitToJson: true)
class Request
{
  @JsonKey(name: "url")
  String? url;
  @JsonKey( name: "method")
  String? method;
  @JsonKey( name: "headers")
  final Map<String, dynamic>? headers;
  @JsonKey(name:"body")
  BodyResponse? body;
  Request(this. url,this.method, this.headers,this.body);
  //from json
  factory Request.fromJson(Map<String,dynamic>json)=>
      _$RequestFromJson(json);
  //to json
  Map<String,dynamic> toJson() => _$RequestToJson(this);

}
//


//-------------------------------------------------------------------------
@JsonSerializable(explicitToJson: true)
class UserDataResponse  {
  @JsonKey(name: "UserId")
  String? UserId;
  @JsonKey(name: "UserName")
  String? UserName;
  @JsonKey(name: "Device")
  String? Device;
  @JsonKey(name: "TenantName")
  String? TenantName;
  @JsonKey(name: "EmployeeId")
  int? EmployeeId;
  @JsonKey(name: "EmployeeCode")
  String? EmployeeCode;
  @JsonKey(name: "FullName")
  String? FullName;
  @JsonKey(name: "ArabicName")
  String? ArabicName;
  @JsonKey(name: "EnglishName")
  String? EnglishName;
  @JsonKey(name: "CompanyLogo")
  String? CompanyLogo;
  @JsonKey(name: "CompanyName")
  String? CompanyName;
  @JsonKey(name: "FacePersonGroupId")
  String? FacePersonGroupId;
  @JsonKey(name: "FacePersonId")
  String? FacePersonId;
  @JsonKey(name: "RecognitionModel")
  String? RecognitionModel;
  @JsonKey(name: "MasterImage")
  Map<String,dynamic>? masterImage;
  @JsonKey(name: "ImageVerificationMode")
  int? ImageVerificationMode;
  @JsonKey(name: "LocationVerificationMode")
  int? LocationVerificationMode;
  @JsonKey(name: "SupportGroupAttendance")
  bool? SupportGroupAttendance;


  UserDataResponse(this.UserId, this.UserName, this.Device,this.TenantName, this.EmployeeId,
      this.EmployeeCode, this.FullName,
      this.ArabicName, this.EnglishName, this.CompanyLogo, this.CompanyName,
      this.FacePersonGroupId, this.FacePersonId,
      this.RecognitionModel,
      this.masterImage,
      this.ImageVerificationMode,
      this.LocationVerificationMode,
      this.SupportGroupAttendance)  ;

  //from json
  factory UserDataResponse.fromJson(Map<String, dynamic>json)=>
      _$UserDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}

//---------------------------------------------------------------------
@JsonSerializable(explicitToJson: true)
class UserImageResponse  {
  @JsonKey(name: "UserId")
  String? UserId;
  @JsonKey(name: "data")
  String? data;

  UserImageResponse(this.UserId, this.data)  ;

  //from json
  factory UserImageResponse.fromJson(Map<String, dynamic>json)=>
      _$UserImageResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserImageResponseToJson(this);
}
//_--------------------------------------------------------------------
// @JsonSerializable(explicitToJson: true)
// class MasterImage {
//   @JsonKey(name: "Url")
//   String? ImageUrl;
//   @JsonKey(name: "ApprovedStatus")
//   int? ApprovedStatus;
//   @JsonKey(name: "CanUploadMasterImage")
//   bool? CanUploadMasterImage;
//   @JsonKey(name: "MasterFaceId")
//   String? MasterFaceId;
//
//   MasterImage(this.ImageUrl, this.ApprovedStatus, this.CanUploadMasterImage,
//       this.MasterFaceId);
//
//   //from json
//   factory MasterImage.fromJson(Map<String, dynamic>json)=>
//       _$MasterImageFromJson(json);
//
//   //to json
//   Map<String, dynamic> toJson() => _$MasterImageToJson(this);


//}
//--------------------------------------------------------------------------------
@JsonSerializable()
 // ignore: camel_case_types
 class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "Request")
  Request? request;

  @JsonKey(name: "data")
  UserDataResponse? userdata;

  AuthenticationResponse(this.request,
      this.userdata);

  //from json
// // I will receive data from api
  factory AuthenticationResponse.fromJson(Map<String, dynamic>json)=>
      _$AuthenticationResponseFromJson(json);

// //to json
// // I will send data from the class to api
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);


}


//--------------------------------------------------------------------------------
  @JsonSerializable()
  // ignore: camel_case_types
  class UserProfileResponse extends BaseResponse{
  @JsonKey(name:"data")
  UserDataResponse? userdata  ;
  UserProfileResponse (this.userdata) ;
  //from json
// // I will receive data from api

  factory UserProfileResponse.fromJson(Map<String,dynamic>json)=>
  _$UserProfileResponseFromJson(json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$UserProfileResponseToJson(this);

  }
//-----------------------------------------------------------
//Basic employee data
@JsonSerializable(explicitToJson: true)
class ResultResponse{
  @JsonKey(name: "IsValid")
  bool ? isValid;
  @JsonKey(name: "Message")
  String?  message;
}

@JsonSerializable()
class EmployeeResponse {
  @JsonKey(name: "Id")
  int? empId;
  @JsonKey(name: "ArabicName")
  String? arabicName;
  @JsonKey(name: "EnglishName")
  String? englishName;
  @JsonKey(name: "BirthDate")
  String? birthDate;
  @JsonKey(name: "NationalId")
  String? nationalId;
  @JsonKey(name: "SocialId")
  String? socialId;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "Phone")
  String? phone;
  @JsonKey(name: "EmergencyNumber")
  String? emergencyNumber;
  @JsonKey(name: "Address")
  AddressResponse? Address;
  EmployeeResponse(this.empId,this.arabicName, this.englishName,
      this.birthDate,
      this.nationalId,this.socialId,this.email,this.phone,
      this.emergencyNumber,this.Address);

// from json
  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$EmployeeResponseToJson(this);
}


@JsonSerializable()
class EmployeeSaveResponse {
  @JsonKey(name: "Id")
  int? empId;
  @JsonKey(name: "ArabicName")
  String? arabicName;
  @JsonKey(name: "EnglishName")
  String? englishName;
  @JsonKey(name: "BirthDate")
  String? birthDate;
  @JsonKey(name: "NationalId")
  String? nationalId;
  @JsonKey(name: "SocialId")
  String? socialId;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "Phone")
  String? phone;
  @JsonKey(name: "EmergencyNumber")
  String? emergencyNumber;

  EmployeeSaveResponse(this.empId,this.arabicName, this.englishName,
      this.birthDate,
      this.nationalId,this.socialId,this.email,this.phone,
      this.emergencyNumber);

// from json
  factory EmployeeSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeSaveResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$EmployeeSaveResponseToJson(this);
}
@JsonSerializable()
class AddressSaveResponse {
  @JsonKey(name: "AddressText")
  String? addressText;
  @JsonKey(name: "DistrictId")
  int? districtId;
  @JsonKey(name: "ZipCode")
  String? zipCode;
  @JsonKey(name: "POBox")
  String? POBox;
  AddressSaveResponse (this.addressText, this.districtId, this.zipCode,this.POBox);

// from json
  factory  AddressSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressSaveResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddressSaveResponseToJson(this);
}

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "AddressText")
  String? addressText;
  @JsonKey(name: "DistrictId")
  int? districtId;
  @JsonKey(name: "ZipCode")
  String? zipCode;
  AddressResponse (this.addressText, this.districtId, this.zipCode);

// from json
  factory  AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class CountriesResponse {
  @JsonKey(name: "Id")
  int? countryId;
  @JsonKey(name: "Name")
  String? countryname;

  CountriesResponse (this.countryId, this.countryname);

// from json
  factory  CountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$CountriesResponseToJson(this);
}

@JsonSerializable()
class GovernoratyResponse {
  @JsonKey(name: "Id")
  int? governoratyId;
  @JsonKey(name: "Name")
  String? governoratyname;
  @JsonKey(name: "CountryId")
  int? countryId;

  GovernoratyResponse (this.governoratyId, this.governoratyname,this.countryId);

// from json
  factory  GovernoratyResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernoratyResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GovernoratyResponseToJson(this);
}

@JsonSerializable()
class DistrictResponse {
  @JsonKey(name: "Id")
  int? districtId;
  @JsonKey(name: "Name")
  String? districtname;
  @JsonKey(name: "GovernrateId")
  int? governoratyId;

  DistrictResponse (this.districtId, this.districtname,this.governoratyId);

// from json
  factory  DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
//-----------------------------------------------------------
//Basic Data
//__________________________________________________________
@JsonSerializable()
class DisplayBasicDataResponse {
  //@JsonKey(name:"")
  BasicDataResponse data;
  DisplayBasicDataResponse (this.data);

// toJson
  Map<String, dynamic> toJson() => _$DisplayBasicDataResponseToJson(this);

//fromJson
  factory DisplayBasicDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DisplayBasicDataResponseFromJson(json);
}
////////////////////////////////////////////////////////////////
@JsonSerializable()
class BasicDataResponse
{
  @JsonKey(name: "employee")
  EmployeeResponse? employeeData;
  @JsonKey(name: "allowEdit")
  bool? allowEdit;
  @JsonKey(name: "countries")
  List<CountriesResponse>? countries;
  @JsonKey(name: "selectedCountry")
  int? selectedCountry;
  @JsonKey(name: "governorates")
  List<GovernoratyResponse>? governorates;
  @JsonKey(name: "selectedGovernorate")
  int? selectedGovernorate;
  @JsonKey(name: "districts")
  List<DistrictResponse>? districts;
  @JsonKey(name: "selecteddistrict")
  int? selecteddistrict;
  @JsonKey(name: "address")
  AddressResponse? address;
  BasicDataResponse(this.employeeData,this.allowEdit,this.countries,
      this.selectedCountry,this.governorates,this.selectedGovernorate,
      this.districts,this.selecteddistrict,this.address);

// from json
  factory  BasicDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicDataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$BasicDataResponseToJson(this);


}

//
// class AddressResponse {
//   @JsonKey(name:"AddressText")
//  String? addressText;
//   @JsonKey(name:" DistrictId")
//   String?  districtId;
//   @JsonKey(name:"ZipCode")
//   String?  zipCode;
//
//   AddressResponse (this.addressText,this.districtId,this.zipCode);
//
// // toJson
//   Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
//
// //fromJson
//   factory AddressResponse.fromJson(Map<String, dynamic> json) =>
//       _$AddressResponseFromJson(json);
// }





@JsonSerializable(explicitToJson: true)
class EmployeeBasicDataResponse  extends ResultResponse
{
  @JsonKey(name: "Employee")
  EmployeeSaveResponse?  Employee;
  @JsonKey(name: "Address")
  AddressSaveResponse?  Address;
  EmployeeBasicDataResponse (this.Employee,this.Address) ;
  factory EmployeeBasicDataResponse .fromJson(Map<String,dynamic>json)=>
      _$EmployeeBasicDataResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$EmployeeBasicDataResponseToJson (this);
}
// -----------------------------------------------------------------------------
@JsonSerializable(explicitToJson: true)
class SaveBasicDataResponse  extends ResultResponse
{
  @JsonKey(name: "UserId")
  String? UserId;
  @JsonKey(name: "Employee")
  EmployeeResponse?  Employee;
  @JsonKey(name: "Address")
  AddressResponse?  Address;
  SaveBasicDataResponse (this.UserId,this.Employee,this.Address) ;
  factory SaveBasicDataResponse .fromJson(Map<String,dynamic>json)=>
      _$SaveBasicDataResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$SaveBasicDataResponseToJson (this);
}

//----------------------------------------------------------------
//Skills
//_____________________________________________________________
@JsonSerializable(explicitToJson: true)
class saveEmpSkillsResponse  extends ResultResponse
{
  @JsonKey(name: "UserId")
  String? userId;
  @JsonKey(name: "Date")
  String?  date;
  @JsonKey(name: "GradeId")
  int?  gradeId;
  @JsonKey(name: "QualificationTypeId")
  int?  qualificationTypeId;
  @JsonKey(name: "EmployeeId")
  int?  employeeId;
  saveEmpSkillsResponse (this.userId,this.date,this.gradeId,this.qualificationTypeId,this.employeeId) ;
  factory saveEmpSkillsResponse.fromJson(Map<String,dynamic>json)=>
      _$saveEmpSkillsResponseFromJson(json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$saveEmpSkillsResponseToJson (this);
}

//_______________________________________________________________
@JsonSerializable()
class SkillsResponse
{
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "TypeName")
  String?  typeName;
  @JsonKey(name: "GradeName")
  String?  gradeName;
  @JsonKey(name: "QualificationTypeId")
  int?  qualificationTypeId;
  @JsonKey(name: "Date")
  String?  date;
  @JsonKey(name: "GradeId")
  int?  gradeId;

 SkillsResponse (this.id,this.typeName,this.gradeName,this.qualificationTypeId,this.date,this.gradeId) ;
  factory SkillsResponse.fromJson(Map<String,dynamic>json)=>
      _$SkillsResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$SkillsResponseToJson (this);
}
//_______________________________________________________________
@JsonSerializable()
class GetEmpSkillsResponse {
  @JsonKey(name: "skills")
  List<SkillsResponse>? skillData;
  @JsonKey(name: "allowEdit")
  bool? allowEdit;

  GetEmpSkillsResponse(this.skillData, this.allowEdit);

// from json
  factory GetEmpSkillsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEmpSkillsResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GetEmpSkillsResponseToJson(this);
}

//---------------------------------------------------------------
// AcademicDegree
//_______________________________________________________________

@JsonSerializable(explicitToJson: true)
class saveAcademicDegreeResponse  extends ResultResponse
{
  @JsonKey(name: "UserId")
  String? userId;
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "Major")
  String?  major;
  @JsonKey(name: "University")
  String?  university;
  @JsonKey(name: "Notes")
  String?  notes;
  @JsonKey(name: "EmployeeId")
  int?  EmployeeId;
  @JsonKey(name: "AcademicDegreeTypeId")
  int?  academicDegreeTypeId;
  @JsonKey(name: "GradeId")
  int?  gradeId;
  @JsonKey(name: "DegreeDate")
  String?  degreeDate;


  saveAcademicDegreeResponse (this.userId,this.id,this.major,this.university,this.notes,this.EmployeeId,
      this.academicDegreeTypeId,this.gradeId,this.degreeDate) ;
  factory saveAcademicDegreeResponse.fromJson(Map<String,dynamic>json)=>
      _$saveAcademicDegreeResponseFromJson(json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$saveAcademicDegreeResponseToJson (this);
}
//---------------------------------------------------------------------
@JsonSerializable()
class GetAcademicDegreeResponse {
  @JsonKey(name: "academicDegrees")
  List<AcademicDegreeResponse>? academicDegreeData;
  @JsonKey(name: "allowEdit")
  bool? allowEdit;
  GetAcademicDegreeResponse(this.academicDegreeData, this.allowEdit);

// from json
  factory GetAcademicDegreeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAcademicDegreeResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GetAcademicDegreeResponseToJson(this);
}
//------------------------------------------------------------
@JsonSerializable()
class AcademicDegreeResponse
{
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "TypeName")
  String?  typeName;
  @JsonKey(name: "GradeName")
  String?  gradeName;
  @JsonKey(name: "AcademicDegreeTypeId")
  int?  academicDegreeTypeId;
  @JsonKey(name: "DegreeDate")
  String?  degreeDate;
  @JsonKey(name: "GradeId")
  int?  gradeId;
  @JsonKey(name: "Major")
  String?  major;
  @JsonKey(name: "University")
  String?  universitye;

  AcademicDegreeResponse (this.id,this.typeName,this.gradeName,this.academicDegreeTypeId,this.degreeDate
      ,this.gradeId,this.major,this.universitye) ;
  factory  AcademicDegreeResponse.fromJson(Map<String,dynamic>json)=>
      _$AcademicDegreeResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$AcademicDegreeResponseToJson (this);
}

//Grade
//_______________________________________________________________
@JsonSerializable()
class GradeItemResponse {
  @JsonKey(name: "Value")
  int? value;
  @JsonKey(name: "Text")
  String? text;

  GradeItemResponse (this.value, this.text);

// from json
  factory  GradeItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GradeItemResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GradeItemResponseToJson(this);
}
//______________________________________________________________
@JsonSerializable()
class GradesResponse
{
  List<GradeItemResponse>? data;
  GradesResponse  (this.data) ;
  factory GradesResponse.fromJson(List<dynamic> items)
  {
    var listOfGrade=items.map((grade) => _$GradeItemResponseFromJson(grade)).toList();
    return GradesResponse(listOfGrade);
  }
  Map<String,dynamic> toJson() => _$GradesResponseToJson (this);
}





//_______________________________________________________________
//Academic Type
//_______________________________________________________________
@JsonSerializable()
class AcademicItemResponse {
  @JsonKey(name: "Value")
  int? value;
  @JsonKey(name: "Text")
  String? text;

  AcademicItemResponse (this.value, this.text);

// from json
  factory  AcademicItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AcademicItemResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AcademicItemResponseToJson(this);
}
//______________________________________________________________
@JsonSerializable()
class AcademicResponse
{
  List<AcademicItemResponse>? data;
  AcademicResponse  (this.data) ;
  factory AcademicResponse.fromJson(List<dynamic> items)
  {
    var listOfAcademic=items.map((academic) => _$AcademicItemResponseFromJson(academic)).toList();
    return AcademicResponse(listOfAcademic);
  }
  Map<String,dynamic> toJson() => _$AcademicResponseToJson (this);
}

//---------------------------------------------------------------
//qualification
//________________________________________________________________
@JsonSerializable()
class QualificationItemResponse {
  @JsonKey(name: "Value")
  int? value;
  @JsonKey(name: "Text")
  String? text;

  QualificationItemResponse (this.value, this.text);

// from json
  factory  QualificationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$QualificationItemResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$QualificationItemResponseToJson(this);
}

@JsonSerializable()
class QualificationsResponse
{
  List<QualificationItemResponse>? data;
  QualificationsResponse  (this.data) ;
  factory QualificationsResponse.fromJson(List<dynamic> items)
  {
    var listOfQualification=items.map((qualification) => _$QualificationItemResponseFromJson(qualification)).toList();
    return QualificationsResponse(listOfQualification);
  }
  Map<String,dynamic> toJson() => _$QualificationsResponseToJson (this);
}
//_______________________________________________________________


@JsonSerializable(explicitToJson: true)
class VacationItemResponse
{
  @JsonKey(name: "employeeName")
  String? employeeName;
  @JsonKey(name: "employeeId")
  int? employeeId;
  @JsonKey(name: "employeeCode")
  String? employeeCode;
  @JsonKey(name: "JobTitle")
  String? JobTitle;
  @JsonKey(name: "VacationTypeName")
  String?  VacationTypeName;
  @JsonKey(name: "VacationTypeDuration")
  double?  VacationTypeDuration;
  @JsonKey(name: "Transferred")
  double? Transferred;
  @JsonKey(name: "Total")
  double? Total;
  @JsonKey(name: "Consumed")
  double?  Consumed;
  @JsonKey(name: "Available")
  double? Available;
  @JsonKey(name: "Pending")
  double? Pending;
  VacationItemResponse (this.employeeName,this.employeeId,this.employeeCode,this.VacationTypeName
      ,this.VacationTypeDuration,
      this.Transferred,this.Total,this.Consumed,this.Available,this.Pending) ;
  factory VacationItemResponse .fromJson(Map<String,dynamic>?json)=>
      _$VacationItemResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$VacationItemResponseToJson (this);
}
@JsonSerializable()
class VacationsResponse
{
 List<VacationItemResponse>? data;
  VacationsResponse  (this.data) ;
  factory VacationsResponse.fromJson(List<dynamic> items)
  {
    var listOfVacation=items.map((vacation) => _$VacationItemResponseFromJson(vacation)).toList();
    return VacationsResponse(listOfVacation);
  }
  Map<String,dynamic> toJson() => _$VacationsResponseToJson (this);
}



@JsonSerializable(explicitToJson: true)
class VacationTypeItemResponse
{
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "Name")
  String?  name;

  VacationTypeItemResponse (this.id,this.name) ;
  factory VacationTypeItemResponse .fromJson(Map<String,dynamic>?json)=>
      _$VacationTypeItemResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$VacationTypeItemResponseToJson (this);
}
@JsonSerializable()
class VacationTypeResponse
{
  List<VacationTypeItemResponse> data;
  VacationTypeResponse  (this.data) ;
  factory VacationTypeResponse.fromJson(List<dynamic> items)
  {
    var listOfVacationType=items.map((vacationType) =>
        _$VacationTypeItemResponseFromJson(vacationType)).toList();
    return VacationTypeResponse(listOfVacationType);
  }
  Map<String,dynamic> toJson() => _$VacationTypeResponseToJson (this);
}
//_________________________Salary______________________________________
@JsonSerializable(explicitToJson: true)
class SalaryItemResponse
{
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "Month")
  String? monthName;
  @JsonKey(name: "Value")
  double? salaryValue;

  SalaryItemResponse (this.id,this.monthName,this.salaryValue) ;
  factory SalaryItemResponse .fromJson(Map<String,dynamic>?json)=>
      _$SalaryItemResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$SalaryItemResponseToJson (this);
}
//-----------------------------------------------------------------
@JsonSerializable()
class SalaryResponse
{
  List<SalaryItemResponse>? data;
  SalaryResponse  (this.data) ;
  factory SalaryResponse.fromJson(List<dynamic> items)
  {
    var listOfSalary=items.map((salary) => _$SalaryItemResponseFromJson(salary)).toList();
    return SalaryResponse(listOfSalary);
  }
  Map<String,dynamic> toJson() => _$SalaryResponseToJson (this);
}
//_________________________________________________________________
// SalaryDetails
//-----------------------------------------------------------------

@JsonSerializable(explicitToJson: true)
class BenefitItemResponse
{
  @JsonKey(name: "Value")
  double? value;
  @JsonKey(name: "ItemName")
  String? ItemName;
  @JsonKey(name:"ShowOnPaySlip")
  bool? showOnPaySlip;

  BenefitItemResponse (this.value,this.ItemName,this.showOnPaySlip) ;
  factory BenefitItemResponse .fromJson(Map<String,dynamic>?json)=>
      _$BenefitItemResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$BenefitItemResponseToJson (this);
}


@JsonSerializable(explicitToJson: true)
class DeductedItemResponse
{
  @JsonKey(name: "Value")
  double? value;
  @JsonKey(name: "ItemName")
  String? ItemName;
  @JsonKey(name:"ShowOnPaySlip")
  bool? showOnPaySlip;

  DeductedItemResponse (this.value,this.ItemName,this.showOnPaySlip) ;
  factory DeductedItemResponse .fromJson(Map<String,dynamic>?json)=>
      _$DeductedItemResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$DeductedItemResponseToJson (this);
}


@JsonSerializable()
class SalaryDetailsResponse
{
  @JsonKey(name: "EmployeeName")
  String? employeeName;
  @JsonKey(name: "Month")
  String? month;
  @JsonKey(name:"BenefitItems")
  List<BenefitItemResponse>? benefitItems;
  @JsonKey(name:"DeductedItems")
  List<DeductedItemResponse>? deductedItems;
  @JsonKey(name: "TotalBenefits")
  double? totalBenefits;
  @JsonKey(name: "TotalDeductions")
  double? totalDeducted;
  @JsonKey(name: "payslipItems")
  List<dynamic>? paysLipItems;
  @JsonKey(name: "NetSalary")
  double? netSalary;
  @JsonKey(name: "Max")
  double? max;
  @JsonKey(name: "HideNetSalary")
  bool? hideNetSalary;

  SalaryDetailsResponse (this.employeeName,this.month,this.benefitItems,
      this.deductedItems,this.totalBenefits,this.totalDeducted,this.paysLipItems,
      this.netSalary,this.max,this.hideNetSalary) ;
  factory SalaryDetailsResponse.fromJson(Map<String,dynamic>?json)=>
      _$SalaryDetailsResponseFromJson (json!);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$SalaryDetailsResponseToJson (this);
}
// @JsonSerializable()
// class SalaryDetailsObjectResponse  {
//   @JsonKey(name:'' )
//   SalaryDetailsResponse ? data;
//   SalaryDetailsObjectResponse (this.data);
//
// // toJson
//   Map<String, dynamic> toJson() => _$SalaryDetailsObjectResponseToJson(this);
//
// //fromJson
//   factory SalaryDetailsObjectResponse .fromJson(Map<String, dynamic> json) =>
//       _$SalaryDetailsObjectResponse FromJson(json);
// }

//---------------------Atendance--------------------------
@JsonSerializable()
class AttendanceItemResponse {

  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'Mode')
  String? mode;
  @JsonKey(name: 'Action')
  String? action;
  @JsonKey(name: 'ActionTime')
  DateTime? actionTime;

  AttendanceItemResponse(this.id, this.mode, this.action, this.actionTime);

// toJson
  Map<String, dynamic> toJson() => _$AttendanceItemResponseToJson(this);

//fromJson
  factory AttendanceItemResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceItemResponseFromJson(json);
}

@JsonSerializable()
class AttendanceResponse
{
  @JsonKey(name: 'data')
  List<AttendanceItemResponse>? attendance;

  AttendanceResponse(this.attendance);

// toJson
  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);

//fromJson
  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
}