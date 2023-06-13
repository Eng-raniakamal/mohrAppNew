// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..code = json['code'] as int?
    ..status = json['status'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
    };

BodyResponse _$BodyResponseFromJson(Map<String, dynamic> json) {
  return BodyResponse(
    json['UserName'] as String?,
    json['Password'] as String?,
    json['DeviceId'] as String?,
  );
}

Map<String, dynamic> _$BodyResponseToJson(BodyResponse instance) =>
    <String, dynamic>{
      'UserName': instance.email,
      'Password': instance.password,
      'DeviceId': instance.deviceId,
    };

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    json['url'] as String?,
    json['method'] as String?,
    json['headers'] as Map<String, dynamic>?,
    json['body'] == null
        ? null
        : BodyResponse.fromJson(json['body'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'url': instance.url,
      'method': instance.method,
      'headers': instance.headers,
      'body': instance.body?.toJson(),
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) {
  return UserDataResponse(
    json['UserId'] as String?,
    json['UserName'] as String?,
    json['Device'] as String?,
    json['TenantName'] as String?,
    json['EmployeeId'] as int?,
    json['EmployeeCode'] as String?,
    json['FullName'] as String?,
    json['ArabicName'] as String?,
    json['EnglishName'] as String?,
    json['CompanyLogo'] as String?,
    json['CompanyName'] as String?,
    json['FacePersonGroupId'] as String?,
    json['FacePersonId'] as String?,
    json['RecognitionModel'] as String?,
    json['MasterImage'] as Map<String, dynamic>?,
    json['ImageVerificationMode'] as int?,
    json['LocationVerificationMode'] as int?,
    json['SupportGroupAttendance'] as bool?,
  );
}

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'UserId': instance.UserId,
      'UserName': instance.UserName,
      'Device': instance.Device,
      'TenantName': instance.TenantName,
      'EmployeeId': instance.EmployeeId,
      'EmployeeCode': instance.EmployeeCode,
      'FullName': instance.FullName,
      'ArabicName': instance.ArabicName,
      'EnglishName': instance.EnglishName,
      'CompanyLogo': instance.CompanyLogo,
      'CompanyName': instance.CompanyName,
      'FacePersonGroupId': instance.FacePersonGroupId,
      'FacePersonId': instance.FacePersonId,
      'RecognitionModel': instance.RecognitionModel,
      'MasterImage': instance.masterImage,
      'ImageVerificationMode': instance.ImageVerificationMode,
      'LocationVerificationMode': instance.LocationVerificationMode,
      'SupportGroupAttendance': instance.SupportGroupAttendance,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    json['Request'] == null
        ? null
        : Request.fromJson(json['Request'] as Map<String, dynamic>),
    json['data'] == null
        ? null
        : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int?
    ..status = json['status'] as String?;
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'Request': instance.request,
      'data': instance.userdata,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) {
  return UserProfileResponse(
    json['data'] == null
        ? null
        : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int?
    ..status = json['status'] as String?;
}

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.userdata,
    };

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) {
  return ResultResponse()
    ..isValid = json['IsValid'] as bool?
    ..message = json['Message'] as String?;
}

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
    };

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) {
  return EmployeeResponse(
    json['ArabicName'] as String?,
    json['EnglishName'] as String?,
    json['BirthDate'] as String?,
    json['NationalId'] as String?,
    json['SocialId'] as String?,
    json['Email'] as String?,
    json['Phone'] as String?,
    json['EmergencyNumber'] as String?,
  );
}

Map<String, dynamic> _$EmployeeResponseToJson(EmployeeResponse instance) =>
    <String, dynamic>{
      'ArabicName': instance.arabicName,
      'EnglishName': instance.englishName,
      'BirthDate': instance.birthDate,
      'NationalId': instance.nationalId,
      'SocialId': instance.socialId,
      'Email': instance.email,
      'Phone': instance.phone,
      'EmergencyNumber': instance.emergencyNumber,
    };

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) {
  return AddressResponse(
    json['AddressText'] as String?,
    json['DistrictId'] as int?,
    json['POBox'] as String?,
    json['ZipCode'] as String?,
  );
}

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'AddressText': instance.addressText,
      'DistrictId': instance.districtId,
      'POBox': instance.pOBox,
      'ZipCode': instance.zipCode,
    };

EmployeeBasicDataResponse _$EmployeeBasicDataResponseFromJson(
    Map<String, dynamic> json) {
  return EmployeeBasicDataResponse(
    json['UserId'] as String?,
    json['Employee'] == null
        ? null
        : EmployeeResponse.fromJson(json['Employee'] as Map<String, dynamic>),
    json['Address'] == null
        ? null
        : AddressResponse.fromJson(json['Address'] as Map<String, dynamic>),
  )
    ..isValid = json['IsValid'] as bool?
    ..message = json['Message'] as String?;
}

Map<String, dynamic> _$EmployeeBasicDataResponseToJson(
        EmployeeBasicDataResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'UserId': instance.UserId,
      'Employee': instance.Employee?.toJson(),
      'Address': instance.Address?.toJson(),
    };

EmployeeSkillsResponse _$EmployeeSkillsResponseFromJson(
    Map<String, dynamic> json) {
  return EmployeeSkillsResponse(
    json['UserId'] as String?,
    json['Date'] as String?,
    json['GradeId'] as int?,
    json['QualificationTypeId'] as int?,
    json['EmployeeId'] as int?,
  )
    ..isValid = json['IsValid'] as bool?
    ..message = json['Message'] as String?;
}

Map<String, dynamic> _$EmployeeSkillsResponseToJson(
        EmployeeSkillsResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'UserId': instance.userId,
      'Date': instance.date,
      'GradeId': instance.gradeId,
      'QualificationTypeId': instance.qualificationTypeId,
      'EmployeeId': instance.employeeId,
    };

VacationItemResponse _$VacationItemResponseFromJson(Map<String, dynamic> json) {
  return VacationItemResponse(
    json['employeeName'] as String?,
    json['employeeId'] as int?,
    json['employeeCode'] as String?,
    json['VacationTypeName'] as String?,
    (json['VacationTypeDuration'] as num?)?.toDouble(),
    (json['Transferred'] as num?)?.toDouble(),
    (json['Total'] as num?)?.toDouble(),
    (json['Consumed'] as num?)?.toDouble(),
    (json['Available'] as num?)?.toDouble(),
    (json['Pending'] as num?)?.toDouble(),
  )..JobTitle = json['JobTitle'] as String?;
}

Map<String, dynamic> _$VacationItemResponseToJson(
        VacationItemResponse instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'employeeId': instance.employeeId,
      'employeeCode': instance.employeeCode,
      'JobTitle': instance.JobTitle,
      'VacationTypeName': instance.VacationTypeName,
      'VacationTypeDuration': instance.VacationTypeDuration,
      'Transferred': instance.Transferred,
      'Total': instance.Total,
      'Consumed': instance.Consumed,
      'Available': instance.Available,
      'Pending': instance.Pending,
    };

VacationsResponse _$VacationsResponseFromJson(Map<String, dynamic> json) {
  return VacationsResponse(
    (json['data'] as List<dynamic>?)
        ?.map((e) => VacationItemResponse.fromJson(e as Map<String, dynamic>?))
        .toList(),
  );
}

Map<String, dynamic> _$VacationsResponseToJson(VacationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
