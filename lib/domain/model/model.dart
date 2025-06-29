


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
   dynamic masterImage;
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

class Reviewers{
  final int employeeId;
  final String code;
  final String name;
  Reviewers(this.employeeId,this.code,this.name);
}

class EmployeeReviewers {
  final int? id;
  final int? employeeId;
  final String? name;
  final String? code;
  final String? picPath;
  final int? order;
  final bool? singleApprovalEnabled;
  final bool? isCurrent;
  // "Id": 19775,
  // "EmployeeId": 19775,
  // "Name": "menna khaled fathy",
  // "Code": "0000",
  // "PicPath": "/Content/Images/employeeIcon.png",
  // "Order": 1,
  // "SingleApprovalEnabled": false,
  //"IsCurrent": true

  EmployeeReviewers(
      {
        required this.id,
        required this.employeeId,
        required this.name,
        required this.code,
        required this.picPath,
        required this.order,
        required this.singleApprovalEnabled,
        required this.isCurrent,
      });

  factory EmployeeReviewers.fromJson(Map<String, dynamic> json) {
    return EmployeeReviewers(
        id: json["Id"],
        employeeId: json["employeeId"],
        name: json["Name"],
        code: json["code"],
        picPath: json["picPath"],
        order: json["Order"],
        singleApprovalEnabled: json["SingleApprovalEnabled"],
        isCurrent: json["IsCurrent"]
    );
  }
}


class SaveVacation{

  final int vacationTypeId;
  final String fromDate;
  final String toDate;
  final int duration;
  final String notes;
  final List <Reviewers> reviewers;


  SaveVacation({
    required this.vacationTypeId,
    required this.fromDate,
    required this.toDate,
    required this.duration,
    required this.notes,
    required this.reviewers

  });

  factory SaveVacation.fromJson(Map<String, dynamic> json) {
    return SaveVacation(
        vacationTypeId: json["vacationTypeId"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        duration: json["duration"],
        notes: json["notes"],
        reviewers: json["reviewers"]
    );
  }
}
class ValidationVacationModel {
  final bool? isValid;
  final String? message;
  final int? duration;
  final int? overBalance;
  final int? handlingId;

  ValidationVacationModel ({
    required this.isValid,
    required this.message,
    required this.duration,
    required this.overBalance,
    required this.handlingId,

  });
  factory ValidationVacationModel.fromJson(Map<String, dynamic> json) {
    return ValidationVacationModel(
      isValid: json["IsValid"],
      message: json["Message"],
      duration: json["Duration"],
      overBalance: json["OverBalance"],
      handlingId: json["HandlingId"],
    );
  }
}
class VacationRequests {
  final String? requestDate;
  final int? id;
  final String? employeeName;
  final String? employeeCode;
  final String? department;
  final String? jobTitle;
  final String? from;
  final String? to;
  final double? duration;
  final  String? attachments;
  final Map<String,dynamic> balance;
  final String? vacationTypeName;
  final String? replacementName;
  final  int? requestedId;
  final String? status;
  final  bool? editable;
  final List<dynamic> reviewers;

  VacationRequests ({
    required this.requestDate,
    required this.id,
    required this.employeeName,
    required this.employeeCode,
    required this.department,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.duration,
    required this.attachments,
    required this.balance,
    required this.vacationTypeName,
    required this.replacementName,
    required this.requestedId,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory VacationRequests.fromJson(Map<String, dynamic> json) {
    return VacationRequests(
      requestDate: json["RequestDate"],
      id:json["Id"],
      employeeName:json["EmployeeName"],
      employeeCode:json["EmployeeCode"],
      department:json["Department"],
      jobTitle:json["JobTitle"],
      from: json["From"],
      to: json["To"],
      duration: json["Duration"],
      attachments: json["Attachments"],
      balance:json["Balance"],
      vacationTypeName:json["VacationTypeName"],
      replacementName:json["ReplacementName"],
      requestedId:json["ReplacementName"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],

    );
  }
}
class VacationsType {
  final int? id;
  final String? name;
  final int? type;
  final int? balance;
  final int? limit;
  final bool? requiredAttachment;
  VacationsType ({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.limit,
    required this.requiredAttachment,
  });
  factory VacationsType.fromJson(Map<String, dynamic> json) {
    return VacationsType(
        id: json["Id"],
        name: json["Name"],
        type: json["Type"],
        balance: json["Balance"],
        limit: json["Limit"],
        requiredAttachment:json["RequiredAttachment"]
    );
  }
}


class Permissions {
  final String? requestDate;
  final String? permissionTypeName;
  final String? from;
  final String? to;
  final String? destination;
  final  double? duration;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<dynamic> reviewers;

  Permissions ({
    required this.requestDate,
    required this.permissionTypeName,
    required this.from,
    required this.to,
    required this.destination,
    required this.duration,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      requestDate: json["RequestDate"],
      permissionTypeName:json["PermissionTypeName"],
      from: json["From"],
      to: json["To"],
      destination: json["Destination"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ValidationPermissionModel {
  final String? message;
  final bool? isValid;


  ValidationPermissionModel ({
    required this.message,
    required this.isValid,
  });
  factory ValidationPermissionModel.fromJson(Map<String, dynamic> json) {
    return ValidationPermissionModel(
        message: json["message"],
        isValid: json["IsValid"]);

  }
}
class ReviewPermissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final  double? duration;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewPermissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewPermissions.fromJson(Map<String, dynamic> json) {
    return ReviewPermissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedPermissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final  double? duration;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedPermissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedPermissions.fromJson(Map<String, dynamic> json) {
    return ReviewedPermissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}


class Missions {
  final String? requestDate;
  final String? from;
  final String? to;
  final String? destination;
  final  String? duration;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<Reviewers> reviewers;

  Missions ({
    required this.requestDate,
    required this.from,
    required this.to,
    required this.destination,
    required this.duration,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory Missions.fromJson(Map<String, dynamic> json) {
    return Missions(
      requestDate: json["RequestDate"],
      from: json["From"],
      to: json["To"],
      destination: json["Destination"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewMissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final String? destination;
  final  String? duration;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewMissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.destination,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewMissions.fromJson(Map<String, dynamic> json) {
    return ReviewMissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      destination: json["Destination"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedMissions {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? from;
  final String? to;
  final String? duration;
  final String? notes;
  final bool editable;
  final String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedMissions ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.from,
    required this.to,
    required this.duration,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedMissions.fromJson(Map<String, dynamic> json) {
    return ReviewedMissions(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      from: json["From"],
      to: json["To"],
      duration: json["Duration"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ValidationMissionModel {
  final bool? isValid;


  ValidationMissionModel ({
    required this.isValid,
  });
  factory ValidationMissionModel.fromJson(Map<String, dynamic> json) {
    return ValidationMissionModel(
        isValid: json["IsValid"]);

  }
}


class FinancialType {
  final int? id;
  final String? name;
  final bool? isEditableByEmployee;
  final double? defaultValue;

  FinancialType ({
    required this.id,
    required this.name,
    required this.isEditableByEmployee,
    required this.defaultValue

  });
  factory FinancialType.fromJson(Map<String, dynamic> json) {
    return FinancialType(
        id: json["Id"],
        name: json["Name"],
        isEditableByEmployee: json["IsEditableByEmployee"],
        defaultValue: json["DefaultValue"]

    );
  }
}
class SaveFinancial {
  final int? requestType;
  final String? date;
  final List<Reviewers> reviewers;

  SaveFinancial({
    required this.requestType,
    required this.date,
    required this.reviewers
  });
  factory SaveFinancial.fromJson(Map<String, dynamic> json) {
    return SaveFinancial(
      requestType: json["requestType"],
      date: json["date"],
      reviewers: json["reviewers"],

    );
  }
}
class Financial {
  final String? requestDate;
  final String? requestType;
  final String? date;
  final String? value;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<Reviewers> reviewers;

  Financial ({
    required this.requestDate,
    required this.requestType,
    required this.date,
    required this.value,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory Financial.fromJson(Map<String, dynamic> json) {
    return Financial(
      requestDate: json["RequestDate"],
      requestType: json["RequestType"],
      date: json["Date"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewFinancialModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewFinancialModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewFinancialModel.fromJson(Map<String, dynamic> json) {
    return ReviewFinancialModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedFinancialModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedFinancialModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedFinancialModel.fromJson(Map<String, dynamic> json) {
    return ReviewedFinancialModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}


class AdminType {
  final int? id;
  final String? name;
  final bool? isEditableByEmployee;
  final double? defaultValue;

  AdminType ({
    required this.id,
    required this.name,
    required this.isEditableByEmployee,
    required this.defaultValue

  });
  factory AdminType.fromJson(Map<String, dynamic> json) {
    return AdminType(
        id: json["Id"],
        name: json["Name"],
        isEditableByEmployee: json["IsEditableByEmployee"],
        defaultValue: json["DefaultValue"]

    );
  }
}
class SaveAdmin {
  final int? requestType;
  final String? date;
  final List<Reviewers> reviewers;

  SaveAdmin({
    required this.requestType,
    required this.date,
    required this.reviewers
  });
  factory SaveAdmin.fromJson(Map<String, dynamic> json) {
    return SaveAdmin(
      requestType: json["requestType"],
      date: json["date"],
      reviewers: json["reviewers"],

    );
  }
}
class Admin {
  final String? requestDate;
  final String? requestType;
  final String? date;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<Reviewers> reviewers;

  Admin ({
    required this.requestDate,
    required this.requestType,
    required this.date,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      requestDate: json["RequestDate"],
      requestType: json["RequestType"],
      date: json["Date"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewAdminModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewAdminModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewAdminModel.fromJson(Map<String, dynamic> json) {
    return ReviewAdminModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedAdminModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedAdminModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedAdminModel.fromJson(Map<String, dynamic> json) {
    return ReviewedAdminModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}


//change shift
class ChangeShiftType {
  final int? id;
  final String? name;

  ChangeShiftType ({
    required this.id,
    required this.name,
  });
  factory ChangeShiftType.fromJson(Map<String, dynamic> json) {
    return ChangeShiftType(
        id: json["PlanId"],
        name: json["Name"],
    );
  }
}
class SaveChangeShift {
  final int requestType;
  final String? date;
  final int? shiftValue;
  final String? note;
  final List<Reviewers> reviewers;

  SaveChangeShift({
    required this.requestType,
    required this.date,
    required this.shiftValue,
    required this.note,
    required this.reviewers
  });
  factory SaveChangeShift.fromJson(Map<String, dynamic> json) {
    return SaveChangeShift(
      requestType:json["requestType"],
      date: json["date"],
      shiftValue:json["value"],
      note:json["note"],
      reviewers: json["reviewers"],

    );
  }
}
class ChangeShift {
  final String? requestDate;
  final int? value;
  final  String? notes;
  final  String? attachments;
  final  bool? editable;
  final String? status;
  final List<Reviewers> reviewers;

  ChangeShift ({
    required this.requestDate,
    required this.value,
    required this.notes,
    required this.attachments,
    required this.editable,
    required this.status,
    required this.reviewers
  });
  factory ChangeShift.fromJson(Map<String, dynamic> json) {
    return ChangeShift(
      requestDate: json["RequestDate"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewChangeShiftModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewChangeShiftModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewChangeShiftModel.fromJson(Map<String, dynamic> json) {
    return ReviewChangeShiftModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}
class ReviewedChangeShiftModel {
  final String? date;
  final int? id;
  final String? empName;
  final String? empCode;
  final String? empDepartment;
  final String? jobTitle;
  final String? type;
  final  String? value;
  final  String? notes;
  final bool editable;
  final  String? attachments;
  final String? status;
  final List<dynamic> reviewers;

  ReviewedChangeShiftModel ({
    required this.date,
    required this.id,
    required this.empName,
    required this.empCode,
    required this.empDepartment,
    required this.jobTitle,
    required this.type,
    required this.value,
    required this.notes,
    required this.editable,
    required this.attachments,
    required this.status,
    required this.reviewers
  });
  factory ReviewedChangeShiftModel.fromJson(Map<String, dynamic> json) {
    return ReviewedChangeShiftModel(

      date: json["RequestDate"],
      id: json["Id"],
      empName: json["EmployeeName"],
      empCode: json["EmployeeCode"],
      empDepartment: json["Department"],
      jobTitle: json["JobTitle"],
      type: json["Type"],
      value: json["Value"],
      notes: json["Notes"],
      attachments: json["Attachments"],
      editable: json["Editable"],
      status: json["Status"],
      reviewers: json["Reviewers"],
    );
  }
}

class VacationTypeBalancs {
  final String employeeName;
  final int employeeId;
  final String employeeCode;
  final String jobTitle;
  final String vacationTypeName;
  final int vacationTypeId;
  final double vacationTypeDuration;
  final double transferred;
  final double total;
  final double consumed;
  final double pending;
  final double postConsumed;
  final double available;
  final double totalView;
  final double settlemented;
  final int type;
  final bool isAnnual;
  final bool hideBalance;

  VacationTypeBalancs({
    required this.employeeName,
    required this.employeeId,
    required this.employeeCode,
    required this.jobTitle,
    required this.vacationTypeName,
    required this.vacationTypeId,
    required this.vacationTypeDuration,
    required this.transferred,
    required this.total,
    required this.consumed,
    required this.pending,
    required this.postConsumed,
    required this.available,
    required this.totalView,
    required this.settlemented,
    required this.type,
    required this.isAnnual,
    required this.hideBalance
  });

  factory VacationTypeBalancs.fromJson(Map<String, dynamic> json) {
    return VacationTypeBalancs(

      employeeName: json["employeeName"],
      employeeId: json["employeeId"],
      employeeCode: json["employeeCode"],
      jobTitle: json["JobTitle"],
      vacationTypeName: json["VacationTypeName"],
      vacationTypeId: json["VacationTypeId"],
      vacationTypeDuration: json["VacationTypeDuration"],
      transferred: json["Transferred"],
      total: json["Total"],
      consumed: json["Consumed"],
      pending: json["Pending"],
      postConsumed: json["PostConsumed"],
      available: json["Available"],
      totalView: json["TotalView"],
      settlemented: json["Settlemented"],
      type: json["Type"],
      isAnnual: json["IsAnnual"],
      hideBalance: json["HideBalance"],
    );
  }
}
