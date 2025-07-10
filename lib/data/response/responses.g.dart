// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..code = (json['code'] as num?)?.toInt()
  ..status = json['status'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
    };

BodyResponse _$BodyResponseFromJson(Map<String, dynamic> json) => BodyResponse(
      json['UserName'] as String?,
      json['Password'] as String?,
      json['DeviceId'] as String?,
    );

Map<String, dynamic> _$BodyResponseToJson(BodyResponse instance) =>
    <String, dynamic>{
      'UserName': instance.email,
      'Password': instance.password,
      'DeviceId': instance.deviceId,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      json['url'] as String?,
      json['method'] as String?,
      json['headers'] as Map<String, dynamic>?,
      json['body'] == null
          ? null
          : BodyResponse.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'url': instance.url,
      'method': instance.method,
      'headers': instance.headers,
      'body': instance.body?.toJson(),
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['UserId'] as String?,
      json['UserName'] as String?,
      json['Device'] as String?,
      json['TenantName'] as String?,
      (json['EmployeeId'] as num?)?.toInt(),
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
      (json['ImageVerificationMode'] as num?)?.toInt(),
      (json['LocationVerificationMode'] as num?)?.toInt(),
      json['SupportGroupAttendance'] as bool?,
    );

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

UserImageResponse _$UserImageResponseFromJson(Map<String, dynamic> json) =>
    UserImageResponse(
      json['UserId'] as String?,
      json['data'] as String?,
    );

Map<String, dynamic> _$UserImageResponseToJson(UserImageResponse instance) =>
    <String, dynamic>{
      'UserId': instance.UserId,
      'data': instance.data,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['Request'] == null
          ? null
          : Request.fromJson(json['Request'] as Map<String, dynamic>),
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = (json['code'] as num?)?.toInt()
      ..status = json['status'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'Request': instance.request,
      'data': instance.userdata,
    };

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      json['data'] == null
          ? null
          : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = (json['code'] as num?)?.toInt()
      ..status = json['status'] as String?;

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.userdata,
    };

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse()
      ..isValid = json['IsValid'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
    };

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) =>
    EmployeeResponse(
      (json['Id'] as num?)?.toInt(),
      json['ArabicName'] as String?,
      json['EnglishName'] as String?,
      json['BirthDate'] as String?,
      json['NationalId'] as String?,
      json['SocialId'] as String?,
      json['Email'] as String?,
      json['Phone'] as String?,
      json['EmergencyNumber'] as String?,
      json['Address'] == null
          ? null
          : AddressResponse.fromJson(json['Address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeResponseToJson(EmployeeResponse instance) =>
    <String, dynamic>{
      'Id': instance.empId,
      'ArabicName': instance.arabicName,
      'EnglishName': instance.englishName,
      'BirthDate': instance.birthDate,
      'NationalId': instance.nationalId,
      'SocialId': instance.socialId,
      'Email': instance.email,
      'Phone': instance.phone,
      'EmergencyNumber': instance.emergencyNumber,
      'Address': instance.Address,
    };

EmployeeSaveResponse _$EmployeeSaveResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeSaveResponse(
      (json['Id'] as num?)?.toInt(),
      json['ArabicName'] as String?,
      json['EnglishName'] as String?,
      json['BirthDate'] as String?,
      json['NationalId'] as String?,
      json['SocialId'] as String?,
      json['Email'] as String?,
      json['Phone'] as String?,
      json['EmergencyNumber'] as String?,
    );

Map<String, dynamic> _$EmployeeSaveResponseToJson(
        EmployeeSaveResponse instance) =>
    <String, dynamic>{
      'Id': instance.empId,
      'ArabicName': instance.arabicName,
      'EnglishName': instance.englishName,
      'BirthDate': instance.birthDate,
      'NationalId': instance.nationalId,
      'SocialId': instance.socialId,
      'Email': instance.email,
      'Phone': instance.phone,
      'EmergencyNumber': instance.emergencyNumber,
    };

AddressSaveResponse _$AddressSaveResponseFromJson(Map<String, dynamic> json) =>
    AddressSaveResponse(
      json['AddressText'] as String?,
      (json['DistrictId'] as num?)?.toInt(),
      json['ZipCode'] as String?,
      json['POBox'] as String?,
    );

Map<String, dynamic> _$AddressSaveResponseToJson(
        AddressSaveResponse instance) =>
    <String, dynamic>{
      'AddressText': instance.addressText,
      'DistrictId': instance.districtId,
      'ZipCode': instance.zipCode,
      'POBox': instance.POBox,
    };

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      json['AddressText'] as String?,
      (json['DistrictId'] as num?)?.toInt(),
      json['ZipCode'] as String?,
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'AddressText': instance.addressText,
      'DistrictId': instance.districtId,
      'ZipCode': instance.zipCode,
    };

CountriesResponse _$CountriesResponseFromJson(Map<String, dynamic> json) =>
    CountriesResponse(
      (json['Id'] as num?)?.toInt(),
      json['Name'] as String?,
    );

Map<String, dynamic> _$CountriesResponseToJson(CountriesResponse instance) =>
    <String, dynamic>{
      'Id': instance.countryId,
      'Name': instance.countryname,
    };

GovernoratyResponse _$GovernoratyResponseFromJson(Map<String, dynamic> json) =>
    GovernoratyResponse(
      (json['Id'] as num?)?.toInt(),
      json['Name'] as String?,
      (json['CountryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GovernoratyResponseToJson(
        GovernoratyResponse instance) =>
    <String, dynamic>{
      'Id': instance.governoratyId,
      'Name': instance.governoratyname,
      'CountryId': instance.countryId,
    };

DistrictResponse _$DistrictResponseFromJson(Map<String, dynamic> json) =>
    DistrictResponse(
      (json['Id'] as num?)?.toInt(),
      json['Name'] as String?,
      (json['GovernrateId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DistrictResponseToJson(DistrictResponse instance) =>
    <String, dynamic>{
      'Id': instance.districtId,
      'Name': instance.districtname,
      'GovernrateId': instance.governoratyId,
    };

DisplayBasicDataResponse _$DisplayBasicDataResponseFromJson(
        Map<String, dynamic> json) =>
    DisplayBasicDataResponse(
      BasicDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DisplayBasicDataResponseToJson(
        DisplayBasicDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BasicDataResponse _$BasicDataResponseFromJson(Map<String, dynamic> json) =>
    BasicDataResponse(
      json['employee'] == null
          ? null
          : EmployeeResponse.fromJson(json['employee'] as Map<String, dynamic>),
      json['allowEdit'] as bool?,
      (json['countries'] as List<dynamic>?)
          ?.map((e) => CountriesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['selectedCountry'] as num?)?.toInt(),
      (json['governorates'] as List<dynamic>?)
          ?.map((e) => GovernoratyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['selectedGovernorate'] as num?)?.toInt(),
      (json['districts'] as List<dynamic>?)
          ?.map((e) => DistrictResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['selecteddistrict'] as num?)?.toInt(),
      json['address'] == null
          ? null
          : AddressResponse.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BasicDataResponseToJson(BasicDataResponse instance) =>
    <String, dynamic>{
      'employee': instance.employeeData,
      'allowEdit': instance.allowEdit,
      'countries': instance.countries,
      'selectedCountry': instance.selectedCountry,
      'governorates': instance.governorates,
      'selectedGovernorate': instance.selectedGovernorate,
      'districts': instance.districts,
      'selecteddistrict': instance.selecteddistrict,
      'address': instance.address,
    };

EmployeeBasicDataResponse _$EmployeeBasicDataResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeBasicDataResponse(
      json['Employee'] == null
          ? null
          : EmployeeSaveResponse.fromJson(
              json['Employee'] as Map<String, dynamic>),
      json['Address'] == null
          ? null
          : AddressSaveResponse.fromJson(
              json['Address'] as Map<String, dynamic>),
    )
      ..isValid = json['IsValid'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$EmployeeBasicDataResponseToJson(
        EmployeeBasicDataResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'Employee': instance.Employee?.toJson(),
      'Address': instance.Address?.toJson(),
    };

SaveBasicDataResponse _$SaveBasicDataResponseFromJson(
        Map<String, dynamic> json) =>
    SaveBasicDataResponse(
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

Map<String, dynamic> _$SaveBasicDataResponseToJson(
        SaveBasicDataResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'UserId': instance.UserId,
      'Employee': instance.Employee?.toJson(),
      'Address': instance.Address?.toJson(),
    };

saveEmpSkillsResponse _$saveEmpSkillsResponseFromJson(
        Map<String, dynamic> json) =>
    saveEmpSkillsResponse(
      json['UserId'] as String?,
      json['Date'] as String?,
      (json['GradeId'] as num?)?.toInt(),
      (json['QualificationTypeId'] as num?)?.toInt(),
      (json['EmployeeId'] as num?)?.toInt(),
    )
      ..isValid = json['IsValid'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$saveEmpSkillsResponseToJson(
        saveEmpSkillsResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'UserId': instance.userId,
      'Date': instance.date,
      'GradeId': instance.gradeId,
      'QualificationTypeId': instance.qualificationTypeId,
      'EmployeeId': instance.employeeId,
    };

SkillsResponse _$SkillsResponseFromJson(Map<String, dynamic> json) =>
    SkillsResponse(
      (json['Id'] as num?)?.toInt(),
      json['TypeName'] as String?,
      json['GradeName'] as String?,
      (json['QualificationTypeId'] as num?)?.toInt(),
      json['Date'] as String?,
      (json['GradeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SkillsResponseToJson(SkillsResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'TypeName': instance.typeName,
      'GradeName': instance.gradeName,
      'QualificationTypeId': instance.qualificationTypeId,
      'Date': instance.date,
      'GradeId': instance.gradeId,
    };

GetEmpSkillsResponse _$GetEmpSkillsResponseFromJson(
        Map<String, dynamic> json) =>
    GetEmpSkillsResponse(
      (json['skills'] as List<dynamic>?)
          ?.map((e) => SkillsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['allowEdit'] as bool?,
    );

Map<String, dynamic> _$GetEmpSkillsResponseToJson(
        GetEmpSkillsResponse instance) =>
    <String, dynamic>{
      'skills': instance.skillData,
      'allowEdit': instance.allowEdit,
    };

saveAcademicDegreeResponse _$saveAcademicDegreeResponseFromJson(
        Map<String, dynamic> json) =>
    saveAcademicDegreeResponse(
      json['UserId'] as String?,
      (json['Id'] as num?)?.toInt(),
      json['Major'] as String?,
      json['University'] as String?,
      json['Notes'] as String?,
      (json['EmployeeId'] as num?)?.toInt(),
      (json['AcademicDegreeTypeId'] as num?)?.toInt(),
      (json['GradeId'] as num?)?.toInt(),
      json['DegreeDate'] as String?,
    )
      ..isValid = json['IsValid'] as bool?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$saveAcademicDegreeResponseToJson(
        saveAcademicDegreeResponse instance) =>
    <String, dynamic>{
      'IsValid': instance.isValid,
      'Message': instance.message,
      'UserId': instance.userId,
      'Id': instance.id,
      'Major': instance.major,
      'University': instance.university,
      'Notes': instance.notes,
      'EmployeeId': instance.EmployeeId,
      'AcademicDegreeTypeId': instance.academicDegreeTypeId,
      'GradeId': instance.gradeId,
      'DegreeDate': instance.degreeDate,
    };

GetAcademicDegreeResponse _$GetAcademicDegreeResponseFromJson(
        Map<String, dynamic> json) =>
    GetAcademicDegreeResponse(
      (json['academicDegrees'] as List<dynamic>?)
          ?.map(
              (e) => AcademicDegreeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['allowEdit'] as bool?,
    );

Map<String, dynamic> _$GetAcademicDegreeResponseToJson(
        GetAcademicDegreeResponse instance) =>
    <String, dynamic>{
      'academicDegrees': instance.academicDegreeData,
      'allowEdit': instance.allowEdit,
    };

AcademicDegreeResponse _$AcademicDegreeResponseFromJson(
        Map<String, dynamic> json) =>
    AcademicDegreeResponse(
      (json['Id'] as num?)?.toInt(),
      json['TypeName'] as String?,
      json['GradeName'] as String?,
      (json['AcademicDegreeTypeId'] as num?)?.toInt(),
      json['DegreeDate'] as String?,
      (json['GradeId'] as num?)?.toInt(),
      json['Major'] as String?,
      json['University'] as String?,
    );

Map<String, dynamic> _$AcademicDegreeResponseToJson(
        AcademicDegreeResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'TypeName': instance.typeName,
      'GradeName': instance.gradeName,
      'AcademicDegreeTypeId': instance.academicDegreeTypeId,
      'DegreeDate': instance.degreeDate,
      'GradeId': instance.gradeId,
      'Major': instance.major,
      'University': instance.universitye,
    };

GradeItemResponse _$GradeItemResponseFromJson(Map<String, dynamic> json) =>
    GradeItemResponse(
      (json['Value'] as num?)?.toInt(),
      json['Text'] as String?,
    );

Map<String, dynamic> _$GradeItemResponseToJson(GradeItemResponse instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Text': instance.text,
    };

GradesResponse _$GradesResponseFromJson(Map<String, dynamic> json) =>
    GradesResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GradeItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GradesResponseToJson(GradesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AcademicItemResponse _$AcademicItemResponseFromJson(
        Map<String, dynamic> json) =>
    AcademicItemResponse(
      (json['Value'] as num?)?.toInt(),
      json['Text'] as String?,
    );

Map<String, dynamic> _$AcademicItemResponseToJson(
        AcademicItemResponse instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Text': instance.text,
    };

AcademicResponse _$AcademicResponseFromJson(Map<String, dynamic> json) =>
    AcademicResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => AcademicItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AcademicResponseToJson(AcademicResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

QualificationItemResponse _$QualificationItemResponseFromJson(
        Map<String, dynamic> json) =>
    QualificationItemResponse(
      (json['Value'] as num?)?.toInt(),
      json['Text'] as String?,
    );

Map<String, dynamic> _$QualificationItemResponseToJson(
        QualificationItemResponse instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Text': instance.text,
    };

QualificationsResponse _$QualificationsResponseFromJson(
        Map<String, dynamic> json) =>
    QualificationsResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              QualificationItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QualificationsResponseToJson(
        QualificationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

VacationItemResponse _$VacationItemResponseFromJson(
        Map<String, dynamic> json) =>
    VacationItemResponse(
      json['employeeName'] as String?,
      (json['employeeId'] as num?)?.toInt(),
      json['employeeCode'] as String?,
      json['VacationTypeName'] as String?,
      (json['VacationTypeDuration'] as num?)?.toDouble(),
      (json['Transferred'] as num?)?.toDouble(),
      (json['Total'] as num?)?.toDouble(),
      (json['Consumed'] as num?)?.toDouble(),
      (json['Available'] as num?)?.toDouble(),
      (json['Pending'] as num?)?.toDouble(),
    )..JobTitle = json['JobTitle'] as String?;

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

VacationsResponse _$VacationsResponseFromJson(Map<String, dynamic> json) =>
    VacationsResponse(
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => VacationItemResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$VacationsResponseToJson(VacationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

VacationTypeItemResponse _$VacationTypeItemResponseFromJson(
        Map<String, dynamic> json) =>
    VacationTypeItemResponse(
      (json['Id'] as num?)?.toInt(),
      json['Name'] as String?,
    );

Map<String, dynamic> _$VacationTypeItemResponseToJson(
        VacationTypeItemResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
    };

VacationTypeResponse _$VacationTypeResponseFromJson(
        Map<String, dynamic> json) =>
    VacationTypeResponse(
      (json['data'] as List<dynamic>)
          .map((e) =>
              VacationTypeItemResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$VacationTypeResponseToJson(
        VacationTypeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SalaryItemResponse _$SalaryItemResponseFromJson(Map<String, dynamic> json) =>
    SalaryItemResponse(
      (json['Id'] as num?)?.toInt(),
      json['Month'] as String?,
      (json['Value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalaryItemResponseToJson(SalaryItemResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Month': instance.monthName,
      'Value': instance.salaryValue,
    };

SalaryResponse _$SalaryResponseFromJson(Map<String, dynamic> json) =>
    SalaryResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => SalaryItemResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$SalaryResponseToJson(SalaryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BenefitItemResponse _$BenefitItemResponseFromJson(Map<String, dynamic> json) =>
    BenefitItemResponse(
      (json['Value'] as num?)?.toDouble(),
      json['ItemName'] as String?,
      json['ShowOnPaySlip'] as bool?,
    );

Map<String, dynamic> _$BenefitItemResponseToJson(
        BenefitItemResponse instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'ItemName': instance.ItemName,
      'ShowOnPaySlip': instance.showOnPaySlip,
    };

DeductedItemResponse _$DeductedItemResponseFromJson(
        Map<String, dynamic> json) =>
    DeductedItemResponse(
      (json['Value'] as num?)?.toDouble(),
      json['ItemName'] as String?,
      json['ShowOnPaySlip'] as bool?,
    );

Map<String, dynamic> _$DeductedItemResponseToJson(
        DeductedItemResponse instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'ItemName': instance.ItemName,
      'ShowOnPaySlip': instance.showOnPaySlip,
    };

SalaryDetailsResponse _$SalaryDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    SalaryDetailsResponse(
      json['EmployeeName'] as String?,
      json['Month'] as String?,
      (json['BenefitItems'] as List<dynamic>?)
          ?.map((e) => BenefitItemResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
      (json['DeductedItems'] as List<dynamic>?)
          ?.map(
              (e) => DeductedItemResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
      (json['TotalBenefits'] as num?)?.toDouble(),
      (json['TotalDeductions'] as num?)?.toDouble(),
      json['payslipItems'] as List<dynamic>?,
      (json['NetSalary'] as num?)?.toDouble(),
      (json['Max'] as num?)?.toDouble(),
      json['HideNetSalary'] as bool?,
    );

Map<String, dynamic> _$SalaryDetailsResponseToJson(
        SalaryDetailsResponse instance) =>
    <String, dynamic>{
      'EmployeeName': instance.employeeName,
      'Month': instance.month,
      'BenefitItems': instance.benefitItems,
      'DeductedItems': instance.deductedItems,
      'TotalBenefits': instance.totalBenefits,
      'TotalDeductions': instance.totalDeducted,
      'payslipItems': instance.paysLipItems,
      'NetSalary': instance.netSalary,
      'Max': instance.max,
      'HideNetSalary': instance.hideNetSalary,
    };

AttendanceItemResponse _$AttendanceItemResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceItemResponse(
      (json['Id'] as num?)?.toInt(),
      json['Mode'] as String?,
      json['Action'] as String?,
      json['ActionTime'] == null
          ? null
          : DateTime.parse(json['ActionTime'] as String),
    );

Map<String, dynamic> _$AttendanceItemResponseToJson(
        AttendanceItemResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Mode': instance.mode,
      'Action': instance.action,
      'ActionTime': instance.actionTime?.toIso8601String(),
    };

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    AttendanceResponse(
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => AttendanceItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'data': instance.attendance,
    };
