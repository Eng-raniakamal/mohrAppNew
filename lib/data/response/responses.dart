
import 'package:json_annotation/json_annotation.dart';
import 'package:mohr_hr/domain/model/model.dart';
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

  EmployeeResponse(this.arabicName, this.englishName, this.birthDate,
      this.nationalId,this.socialId,this.email,this.phone,this.emergencyNumber);

// from json
  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$EmployeeResponseToJson(this);
}

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "AddressText")
  String? addressText;
  @JsonKey(name: "DistrictId")
  int? districtId;
  @JsonKey(name: "POBox")
  String? pOBox;
  @JsonKey(name: "ZipCode")
  String? zipCode;


  AddressResponse (this.addressText, this.districtId,
      this.pOBox,
      this.zipCode);

// from json
  factory  AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EmployeeBasicDataResponse  extends ResultResponse
{
  @JsonKey(name: "UserId")
  String? UserId;
  @JsonKey(name: "Employee")
  EmployeeResponse?  Employee;
  @JsonKey(name: "Address")
  AddressResponse?  Address;
  EmployeeBasicDataResponse (this.UserId,this.Employee,this.Address) ;
  factory EmployeeBasicDataResponse .fromJson(Map<String,dynamic>json)=>
      _$EmployeeBasicDataResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$EmployeeBasicDataResponseToJson (this);
}
//-end of basic data of employee -----------------------------------------------------------------------------

@JsonSerializable(explicitToJson: true)
class EmployeeSkillsResponse  extends ResultResponse
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
  EmployeeSkillsResponse (this.userId,this.date,this.gradeId,this.qualificationTypeId,this.employeeId) ;
  factory EmployeeSkillsResponse .fromJson(Map<String,dynamic>json)=>
      _$EmployeeSkillsResponseFromJson (json);
// //to json
// // I will send data from the class to api
  Map<String,dynamic> toJson() => _$EmployeeSkillsResponseToJson (this);
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

// @JsonSerializable()
// class VacationDataResponse
// {
  // //@JsonKey(name: "")
  // List <VacationResponse>? vacations;
  // VacationDataResponse (this.vacations) ;

//   factory VacationDataResponse .fromJson(List<dynamic>?json){
//     _$VacationDataResponseFromJson(json!);
//     return VacationDataResponse();
//   }
// // //to json
// // // I will send data from the class to api
//  Map<String,dynamic> toJson() => _$VacationDataResponseToJson (this);
// }

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


//




