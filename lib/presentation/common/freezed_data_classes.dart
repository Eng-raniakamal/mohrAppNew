import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password,String deviceId)
  = _LoginObject;
}

@freezed
 class UserObject with _$UserObject {
   factory UserObject(String userID) = _UserObject;
 }
@freezed
class VacationsObjects with _$VacationsObjects {
  factory VacationsObjects(String userID) = _VacationObjects;
}



@freezed
class empBasicDataObject with _$empBasicDataObject {
  factory empBasicDataObject(
  String userID,
  String ArabicName ,
  String EnglishName,
  String BirthDate,
  String NationalId,
  String SocialId,
  String Email,
  String Phone,
  String Emergency_Number,
  String AddressText,
  int DistrictId,
  String PoBox,
  String ZipCode
      ) = _empBasicDataObject;
}

@freezed
class empSkillsObject with _$empSkillsObject {
  factory empSkillsObject(String userID,
  String Date,
  int GradeId,
  int QualificationId,
  int EmployeeId) = _empSkillsObject;
}
