


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
class UserImageModel
{
  String userId;
  String data;
  UserImageModel(this.userId,this.data);
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
class EmployeeSaveBasicDataModel
{
  //String? userId;
  EmployeeSaveModel? employee;
  AddressSaveModel? address;
  bool? IsValid;
  String? Message;
  EmployeeSaveBasicDataModel(this.employee,this.address,this.IsValid,this.Message);
}


class EmployeeModel
{
  int? empId ;
  String? arabicName ;
  String? englishName;
  String? birthdate;
  String? nationalId;
  String? socialId;
  String? email;
  String? phone;
  String? emergency_Number;
  AddressModel? address;
  EmployeeModel(this.empId,this.arabicName,this.englishName,this.birthdate,this.nationalId,this.socialId,
      this.email,this.phone,this.emergency_Number,this.address);
}

class EmployeeSaveModel
 {

  int? empId ;
  String? arabicName ;
  String? englishName;
  String? birthdate;
  String? nationalId;
  String? socialId;
  String? email;
  String? phone;
  String? emergency_Number;

  EmployeeSaveModel(this.empId,this.arabicName,this.englishName,this.birthdate,this.nationalId,this.socialId,
      this.email,this.phone,this.emergency_Number);
}

class AddressSaveModel
 {
  String? addressText ;
  int? districtId;
  String? zipCode;
  String? pOBox;
  AddressSaveModel(this.addressText,this.districtId,this.zipCode,this.pOBox);
}
class AddressModel
{
  String? addressText ;
  int? districtId;
  String? zipCode;
  AddressModel(this.addressText,this.districtId,this.zipCode);
}
class CountryModel {
  int? countryId;
  String? countryName;
  CountryModel(this.countryId,this.countryName);
}
class GovernorateModel {
  int? governorateId;
  String? governorateName;
  int? countryId;
  GovernorateModel(this.governorateId,this.governorateName,this.countryId);
}

class DistrictsModel {
  int? districtId;
  String? districtName;
  int? governorateId;
  DistrictsModel (this.districtId,this.districtName,this.governorateId);
}

class BasicDataModel{

  EmployeeModel? employee;
  bool? allowEdit;
  List <CountryModel>? country;
  int? selectedcountry;
  List <GovernorateModel>? governorate;
  int? selectedgovernorate;
  List <DistrictsModel>? district;
  int? selecteddistrict;
  AddressModel? address;
  BasicDataModel(this.employee,this.allowEdit,this.country,this.selectedcountry
      ,this.governorate,this.selectedgovernorate,this.district,this.selecteddistrict,
      this.address);
}
//__________Skills--------------------------------

class GradeItem {
  int? value;
  String? text;
  GradeItem(this.value, this.text);
}

class GradesObject {
List<GradeItem> grades;
GradesObject(this.grades);
}

class QualificationItem {
  int? value;
  String? text;
  QualificationItem(this.value, this.text);
}

class QualificationsObject {
  List<QualificationItem> qualifications;
  QualificationsObject(this.qualifications);
}

class skillsModel
{
  int? id;
  String? typeName;
  String? gradeName;
  int? qualificationTypeId;
  String? date;
  int? gradeId;
  skillsModel(this.id, this.typeName,this.gradeName,this.qualificationTypeId,
      this.date,this.gradeId);
}

class SaveEmpSkillsModel {
  String userId;
  String date;
  int gradeId;
  int qualificationTypeId;
  int employeeId;
  bool? IsValid;
  String? Message;
  SaveEmpSkillsModel(this.userId,this.date,this.gradeId,
      this.qualificationTypeId,this.employeeId,this.IsValid,this.Message);
}

class getEmpSkillsModel {
  List<skillsModel>? skills;
  bool? allowEdit;
  getEmpSkillsModel(this.skills,this.allowEdit);
}

///////////////////academic Degree/////////////////////////

class DegreeItem {
  int? value;
  String? text;
  DegreeItem(this.value, this.text);
}

class DegreeObject {
  List<DegreeItem> Degrees;
  DegreeObject(this.Degrees);
}

class AcademicDegreeModel{
  int? id;
  String? typeName;
  String? gradeName;
  int? academicDegreeTypeId;
  String? degreeDate;
  int? gradeId;
  String? major;
  String? university;
  AcademicDegreeModel(this.id, this.typeName,this.gradeName,this.academicDegreeTypeId,
      this.degreeDate,this.gradeId,this.major,this.university);
}

class SaveAcademicDegreeModel {
  String userId;
  int id;
  String major;
  String university;
  String notes;
  int employeeId;
  int academicDegreeTypeId;
  int gradeId;
  String degreeDate;
  SaveAcademicDegreeModel(this.userId,this.id,this.major,this.university,this.notes,
      this.employeeId,this.academicDegreeTypeId,this.gradeId,this.degreeDate);
}

class getAcademicDegreeModel {
  List<AcademicDegreeModel>? academicDegree;
  bool? allowEdit;
  getAcademicDegreeModel(this.academicDegree,this.allowEdit);
}


///////////////////////vactions////////////////////////////
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
    List<Vacation> vacations;
    VacationsData(this.vacations);
   }
class VacationsObject
{
  VacationsData vacationsData;
  VacationsObject(this.vacationsData);
}

class VacationTypeItem
{
  int id ;
  String name;
  VacationTypeItem(this.id,this.name);
}
class VacationType
{
  List<VacationTypeItem> items;
  VacationType (this.items);
}
class VacationTypeObject
{
  VacationType vacationType;
  VacationTypeObject(this.vacationType);
}




///////////////Salary/////////////////////
class SalaryItems
{int id;
  String Month;
  double Value;
  SalaryItems(this.id,this.Month,this.Value);
}

class  SalaryData
{
  List<SalaryItems> salary;
  SalaryData(this.salary);
}

class SalaryObject
{
  SalaryData salaryData;
  SalaryObject(this.salaryData);
}
//---------------------------Attendance-----------------------
// "Id": 17294180,
// "Mode": "Inflexible",
// "Action": "CheckIn",
// "ActionTime": "2022-01-01T11:00:00"
class Attendance
{
  int id;
  String mode;
  String action;
  DateTime actiontime;
  Attendance(this.id,this.mode,this.action,this.actiontime);
}
class AttendanceList
{
  List<Attendance> attendanceList;
  AttendanceList(this.attendanceList);
}
class AttendanceObject
{
  AttendanceList attendancedata;
  AttendanceObject(this.attendancedata);
}

//------------------------------------------------------------

class Benefit
{
  double? value;
  String? ItemName;
  bool? ShowOnPaySlip;
  Benefit(this.value,this.ItemName,this.ShowOnPaySlip);
}

class Deducted
{
  double? value;
  String? ItemName;
  bool? ShowOnPaySlip;
  Deducted(this.value,this.ItemName,this.ShowOnPaySlip);
}

class SalaryDetails
{
  String? employeeName;
  String? month;
  List<Benefit>? benefitItems;
  List<Deducted>? deductedItems;
  double? totalBenefits;
  double? totalDeductions;
  List<dynamic>? paySlipItems;
  double? NetSalary;
  double? Max;
  bool? hideNetSalary;
  SalaryDetails(this.employeeName,this.month,this.benefitItems,
      this.deductedItems,this.totalBenefits,this.totalDeductions,
      this.paySlipItems,this.NetSalary,this.Max,this.hideNetSalary);

}

class SalaryDetailsObject
{
 SalaryDetails data;
 SalaryDetailsObject(this.data);
}


class AlertModel {
  String content;
  String link;

  AlertModel({required this.content,required this.link});

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      content: json["Content"],
      link: json["Link"],

    );
  }
}


class NotificationModel {
  int? id;
  String? date;
  String? title;
  String? details;
  String? notes;
  String? attachments;
  bool? isCanceled;
  bool? seen;
  String? cancellationReason;
  int? employeeId;
  String? name;
  String? executionDate;
  double? value;
  NotificationModel({ this.id,
     this.date,
     this.title,
     this.details,
     this.notes,
     this.attachments,
     this.isCanceled,required this.seen,
     this.cancellationReason,
     this.employeeId,
     this.name,
     this.executionDate,
     this.value,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["Id"],
      date: json["Date"],
      title: json["Title"],
      details: json["Details"],
      notes: json["Notes"],
      attachments:json["Attachments"],
      isCanceled: json["IsCanceled"],
      seen: json["Seen"],
      cancellationReason:json["CancellationReason"],
      employeeId: json["EmployeeId"],
      name: json["Name"],
      executionDate:json["ExecutionDate"],
      value:json["Value"]

    );
  }
}