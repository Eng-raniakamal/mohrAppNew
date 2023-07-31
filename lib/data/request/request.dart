import 'package:mohr_hr/domain/model/model.dart';

class LoginRequest {
  String email;
  String password;
  String deviceId;
  LoginRequest(this.email, this.password,this.deviceId);
}

class qualificationRequest
{
  String userId;
  qualificationRequest(this.userId);
}
class GradeRequest
{
  String userId;
  GradeRequest(this.userId);

}class UserRequest
{
  String userId;
  UserRequest(this.userId);
}



class EmployeeRequest {
  String? userId;
  int? empId;
  String? arabicName ;
  String? englishName;
  String? birthDate;
  String? nationalId;
  String? socialId;
  String? email;
  String? phone;
  String? emergency_Number;
  AddressRequest? addressRequest;
  EmployeeRequest(this.userId,this.empId,this.arabicName,this.englishName,this.birthDate,this.nationalId,
      this.socialId,this.email,this.phone,this.emergency_Number,this.addressRequest);

}

class AddressRequest {
  String? addressText ;
  int? districtId;
  String? zipCode;
  AddressRequest(this.addressText,this.districtId,this.zipCode);
}

class CountryRequest{
  int? countryId;
  String? countryName;
  CountryRequest(this.countryId,this.countryName);
}

class GovernorateRequest{
  int? governorateId;
  String? governorateName;
  GovernorateRequest(this.governorateId,this.governorateName);
}

class DistrictRequest{
  int? districtId;
  String? districtName;
  DistrictRequest(this.districtId,this.districtName);
}

class BasicDataRequest {
  String? userId;
  int? empId;
  BasicDataRequest(this.userId, this.empId);
}


class displaySkillsRequest {
  String? userId;
  int? empId;
  displaySkillsRequest(this.userId, this.empId);
}

class getEmployeeBasicDataRequest
{
  String? userId;
  int? empId;
  EmployeeRequest? empData;
  bool? allowEdit;
  CountryRequest? country;
  int? selectedCountry;
  GovernorateRequest? governorate;
  int? selectedGovernorate;
  DistrictRequest? district;
  int? selecteddistrict;
  Map<String,dynamic>? address;
  getEmployeeBasicDataRequest(this.userId,this.empId,this.empData,this.allowEdit,this.country,this.selectedCountry,this.governorate
      ,this.selectedGovernorate,this.district,this.selecteddistrict,this.address);
}

class Employee
{
  int empId;
  String arabicName;
  String englishName;
  String birthDate;
  String nationalId;
  String socialId;
  String email;
  String phone;
  String emergency_Number;
  Employee(this.empId,this.arabicName,this.englishName,
      this.birthDate,
      this.nationalId,
      this.socialId,
      this.email,
      this.phone,
      this.emergency_Number);

}

class Address
{
  String addressText;
int districtId;
String poBox;
String zipCode;
  Address(
      this.addressText,
      this.districtId,
      this.poBox,
      this.zipCode);
}





class EmployeeBasicDataRequest
{
  String userId;
  Employee employee;
  Address address;
  // int empId;
  // String arabicName;
  // String englishName;
  // String birthDate;
  // String nationalId;
  // String socialId;
  // String email;
  // String phone;
  // String emergency_Number;
  // String addressText;
  // int districtId;
  // String poBox;
  // String zipCode;
  EmployeeBasicDataRequest(
      this.userId,
      this.employee,
      this.address
      // this.empId,
      // this.arabicName,
      // this.englishName,
      // this.birthDate,
      // this.nationalId,
      // this.socialId,
      // this.email,
      // this.phone,
      // this.emergency_Number,
      // this.addressText,
      // this.districtId,
      // this.poBox,
      // this.zipCode
);
}

//  "Date": "2006",
//   "GradeId": 2,
//   "QualificationTypeId": 1,
//   "EmployeeId": 1
class EmployeeSkillsRequest
{
  String userId;
  String date;
  int gradeId;
  int qualificationTypeId;
  int employeeId;
  EmployeeSkillsRequest(this.userId,this.date,this.gradeId,
      this.qualificationTypeId,this.employeeId);
}

class SaveAcademicDegreeRequest
{
  String userId;
  int id;
  String major;
  String university;
  String notes;
  int employeeId;
  int academicDegreeTypeId;
  int gradeId;
  String date;
  SaveAcademicDegreeRequest(this.userId,this.id,this.major,this.university,
      this.notes,this.employeeId,this.academicDegreeTypeId,
      this.gradeId,this.date);
}


class displayAcademicDegreeRequest {
  String? userId;
  int? empId;
  displayAcademicDegreeRequest(this.userId, this.empId);
}




class  displayVacationRequest
{
  String userId;
  String employeeId;
  String vacationTypeName;
  String vacationTypeDuration;
  String transferred;
  String total;
  String consumed;
  String available;
  String pending;

  displayVacationRequest(this.userId,this.employeeId,this.vacationTypeName,
      this.vacationTypeDuration,this.transferred,this.total,this.consumed
      ,this.available,this.pending);
}
class VacationRequest
{
  String UserId;
  VacationRequest(this.UserId);
}

class SalaryRequest
{
  String UserId;
  SalaryRequest(this.UserId);
}

class SalaryDetailsRequest
{
  String userId;
  SalaryDetailsRequest(this.userId);
}