import 'package:mohr_hr/domain/model/model.dart';

class LoginRequest {
  String email;
  String password;
  String deviceId;
  LoginRequest(this.email, this.password,this.deviceId);
}

class UserRequest
{
  String userId;
  UserRequest(this.userId);
}



class EmployeeRequest {
  String? arabicName ;
  String? englishName;
  String? birthDate;
  String? nationalId;
  String? socialId;
  String? email;
  String? phone;
  String? emergency_Number;

}

class AddressRequest {
  String? addressText ;
  int? districtId;
  String? poBox;
  String? zipCode;
}

class EmployeeBasicDataRequest
{
  String userId;
  String ArabicName;
  String EnglishName;
  String BirthDate;
  String NationalId;
  String SocialId;
  String Email;
  String Phone;
  String Emergency_Number;
  String AddressText;
  int DistrictId;
  String PoBox;
  String ZipCode;
  EmployeeBasicDataRequest(
      this.userId,
      this.ArabicName,
      this.EnglishName,
      this.BirthDate,
      this.NationalId,
      this.SocialId,
      this.Email,
      this.Phone,
      this.Emergency_Number,
      this.AddressText,
      this.DistrictId,
      this.PoBox,
      this.ZipCode);
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