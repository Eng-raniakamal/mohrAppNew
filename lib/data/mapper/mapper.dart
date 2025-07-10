import 'package:essmohr/application/extensions.dart';

// to convert the response into a non nullable object (model)

import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;
const  double DOUBLE_ZERO = 0.0;
const FALSE = false;
 DateTime DT_EMPTY=DateTime.now();

extension ResponseMapper on Request? {
  RequestModel toDomain() {
     return RequestModel(this?.url?.orEmpty() ?? EMPTY,this?.method.orEmpty() ?? EMPTY,
     this?.headers ,this?.body.toDomain());
  }
}

extension BodyResponseMapper on BodyResponse? {
  BodyModel toDomain() {
    return BodyModel(this?.email?.orEmpty() ?? EMPTY,
        this?.password?.orEmpty() ?? EMPTY,this?.deviceId?.orEmpty()?? EMPTY);
  }
}

extension DataResponseMapper on UserDataResponse? {
 UserDataModel toDomain() {
    return UserDataModel(
        this?.UserId.orEmpty() ?? EMPTY,
        this?.UserName.orEmpty() ?? EMPTY,
        this?.Device.orEmpty() ?? EMPTY,
        this?.EmployeeId.orZero() ?? ZERO,
        this?.TenantName.orEmpty() ?? EMPTY,
        this?.EmployeeCode.orEmpty() ?? EMPTY,
        this?.FullName.orEmpty() ?? EMPTY,
        this?.ArabicName.orEmpty() ?? EMPTY,
        this?.EnglishName.orEmpty() ?? EMPTY,
        this?.CompanyLogo.orEmpty() ?? EMPTY,
        this?.CompanyName.orEmpty() ?? EMPTY,
        this?.FacePersonGroupId.orEmpty() ?? EMPTY,
        this?.FacePersonId.orEmpty() ?? EMPTY,
        this?.RecognitionModel.orEmpty() ?? EMPTY,
        this?.masterImage,
        this?.ImageVerificationMode.orZero() ?? ZERO,
        this?.LocationVerificationMode.orZero() ?? ZERO,
        this?.SupportGroupAttendance.orfalse() ?? FALSE);
  }

}

extension UserDataModelMapper on UserDataModel {
  Map<String, dynamic> toJson() {
    return {
      'UserId': this.UserId,
      'UserName': this.UserName,
      'Device': this.Device,
      'TenantName': this.TenantName,
      'EmployeeId': this.EmployeeId,
      'EmployeeCode': this.EmployeeCode,
      'FullName': this.FullName,
      'ArabicName': this.ArabicName,
      'EnglishName': this.EnglishName,
      'CompanyLogo': this.CompanyLogo,
      'CompanyName': this.CompanyName,
      'FacePersonGroupId': this.FacePersonGroupId,
      'FacePersonId': this.FacePersonId,
      'RecognitionModel': this.RecognitionModel,
      'MasterImage': this.masterImage,
      'ImageVerificationMode': this.ImageVerificationMode,
      'LocationVerificationMode': this.LocationVerificationMode,
      'SupportGroupAttendance': this.SupportGroupAttendance,
    };
  }

 UserDataModel fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      json['UserId'] ?? EMPTY,
      json['UserName'] ?? EMPTY,
      json['Device'] ?? EMPTY,
      json['EmployeeId'] ?? ZERO,
      json['TenantName'] ?? EMPTY,
      json['EmployeeCode'] ?? EMPTY,
      json['FullName'] ?? EMPTY,
      json['ArabicName'] ?? EMPTY,
      json['EnglishName'] ?? EMPTY,
      json['CompanyLogo'] ?? EMPTY,
      json['CompanyName'] ?? EMPTY,
      json['FacePersonGroupId'] ?? EMPTY,
      json['FacePersonId'] ?? EMPTY,
      json['RecognitionModel'] ?? EMPTY,
      json['MasterImage'],
      json['ImageVerificationMode'] ?? ZERO,
      json['LocationVerificationMode'] ?? ZERO,
      json['SupportGroupAttendance'] ?? FALSE,
    );
  }
}



extension ImageResponseMapper on UserImageResponse? {
  UserImageModel toDomain() {
    return UserImageModel(
        this?.UserId.orEmpty() ?? EMPTY,
        this?.data.orEmpty() ?? EMPTY);
  }

}
  extension AuthenticationResponseMapper  on AuthenticationResponse {
    AuthenticationModel toDomain() {
      //take two request object not request resopnse and the same for data object
      return AuthenticationModel(
          this.request.toDomain(),
          this.userdata.toDomain()
      );
    }

  }
    extension UserDataResponseMapper  on UserProfileResponse {
      EmployeeDataModel toDomain() {
      //take two request object not request resopnse and the same for data object
      return EmployeeDataModel(
          this.userdata.toDomain()
      );
    }
  }
//---employee--BasicData----------------------------------
extension EmployeeResponseMapper on EmployeeResponse? {
  EmployeeModel toDomain() {
    return EmployeeModel(
        this?.empId?.orZero() ?? ZERO,
        this?.arabicName?.orEmpty() ?? EMPTY,
        this?.englishName?.orEmpty() ?? EMPTY,
        this?.birthDate?.orEmpty() ?? EMPTY,
        this?.nationalId?.orEmpty() ?? EMPTY,
        this?.socialId?.orEmpty() ?? EMPTY,
        this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY,
        this?.emergencyNumber?.orEmpty() ?? EMPTY,
        this?.Address.toDomain()
    );
  }
}
extension EmployeeSaveResponseMapper on EmployeeSaveResponse? {
  EmployeeSaveModel toDomain() {
    return EmployeeSaveModel(
        this?.empId?.orZero() ?? ZERO,
        this?.arabicName?.orEmpty() ?? EMPTY,
        this?.englishName?.orEmpty() ?? EMPTY,
        this?.birthDate?.orEmpty() ?? EMPTY,
        this?.nationalId?.orEmpty() ?? EMPTY,
        this?.socialId?.orEmpty() ?? EMPTY,
        this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY,
        this?.emergencyNumber?.orEmpty() ?? EMPTY,

    );
  }
}
extension AddressSaveResponseMapper on AddressSaveResponse? {
  AddressSaveModel toDomain() {
    return AddressSaveModel(
      this?.addressText?.orEmpty() ?? EMPTY,
      this?.districtId?.orZero() ?? ZERO,
      this?.zipCode?.orEmpty() ?? EMPTY,
       this?.POBox?.orEmpty() ?? EMPTY,
    );
  }
}

extension AddressResponseMapper on AddressResponse? {
  AddressModel toDomain() {
    return AddressModel(
        this?.addressText?.orEmpty() ?? EMPTY,
        this?.districtId?.orZero() ?? ZERO,
        this?.zipCode?.orEmpty() ?? EMPTY,
    );
  }
}

extension CountryResponseMapper on CountriesResponse? {
  CountryModel toDomain() {
    return CountryModel(this?.countryId?.orZero() ?? ZERO,
      this?.countryname?.orEmpty() ?? EMPTY,
    );
  }
}

extension GovernoratyResponseMapper on GovernoratyResponse? {
  GovernorateModel toDomain() {
    return GovernorateModel(this?.governoratyId?.orZero() ?? ZERO,
      this?.governoratyname?.orEmpty() ?? EMPTY,this?.countryId?.orZero()
    );
  }
}

extension DistrictResponseMapper on DistrictResponse? {
  DistrictsModel toDomain() {
    return DistrictsModel(this?.districtId?.orZero() ?? ZERO,
      this?.districtname?.orEmpty() ?? EMPTY,this?.governoratyId?.orZero()
    );
  }
}

extension EmployeeBasicDataResponseMapper  on EmployeeBasicDataResponse {
  EmployeeSaveBasicDataModel toDomain() {
    return EmployeeSaveBasicDataModel(
        this.Employee?.toDomain(),
        this.Address?.toDomain(),
      this.isValid?.orfalse()?? FALSE,
      this.message.orEmpty()?? EMPTY
    );
  }
}


//____________for save(post on api)____________-
//______--from model to response_________________
extension saveBasicDataMapper on EmployeeSaveBasicDataModel{
  EmployeeBasicDataResponse toResponse()
  { return EmployeeBasicDataResponse(

      this.employee?.toResponse(),
      this.address?.toResponse(),

  );
  }
}
extension employeesaveBasicDataMapper on EmployeeSaveModel{
  EmployeeSaveResponse  toResponse()
  { return EmployeeSaveResponse (
    this.empId.orZero() ?? ZERO,
    this.arabicName?.orEmpty() ?? EMPTY,
    this.englishName?.orEmpty() ?? EMPTY,
    this.birthdate?.orEmpty() ?? EMPTY,
    this.nationalId?.orEmpty() ?? EMPTY,
    this.socialId?.orEmpty() ?? EMPTY,
    this.email?.orEmpty() ?? EMPTY,
    this.phone?.orEmpty() ?? EMPTY,
    this.emergency_Number?.orEmpty() ?? EMPTY,

  );
  }
}
extension AddressSaveBasicDataMapper on AddressSaveModel? {
  AddressSaveResponse toResponse() {
    return AddressSaveResponse(
      this?.addressText?.orEmpty() ?? EMPTY,
      this?.districtId?.orZero() ?? ZERO,
      this?.zipCode?.orEmpty() ?? EMPTY,
      this?.pOBox?.orEmpty() ?? EMPTY,
    );
  }
}
extension displayBasicDataResponseMapper
on BasicDataResponse{
  BasicDataModel toDomain(){

   EmployeeModel? mappedEmployee= this.employeeData.toDomain();
    bool mappedAllowEdit = this.allowEdit?.orfalse()?? false;
   List<CountryModel> mappedCountry=
   (this.countries?.map((country) => country.toDomain()) ??
       Iterable.empty())
       .cast<CountryModel>()
       .toList();

   int mappedSelectedCountry=this.selectedCountry?.orZero()?? ZERO;

   List<GovernorateModel> mappedGovernorate=
   (this.governorates?.map((governorate) => governorate.toDomain()) ??
       Iterable.empty())
       .cast<GovernorateModel>()
       .toList();

   int mappedSelectedGovernorat=this.selectedGovernorate?.orZero()?? ZERO;
   List<DistrictsModel> mappeddistrict=
   (this.districts?.map((district) => district.toDomain()) ??
       Iterable.empty())
       .cast<DistrictsModel>()
       .toList();

   int mappedSelectedDistrict=this.selecteddistrict?.orZero()?? ZERO;

   AddressModel? mappedAddress = this.address.toDomain();
   var empBasicData= BasicDataModel(mappedEmployee,
       mappedAllowEdit, mappedCountry,mappedSelectedCountry,
       mappedGovernorate, mappedSelectedGovernorat,
       mappeddistrict, mappedSelectedDistrict, mappedAddress);
   return  empBasicData;




  }
}
//------------------------------skills-----------------------------
extension EmployeeSkillsResponseMapper  on saveEmpSkillsResponse {
    SaveEmpSkillsModel toDomain() {
      return SaveEmpSkillsModel(
          this.userId?.orEmpty() ?? EMPTY,
          this.date?.orEmpty() ?? EMPTY,
          this.gradeId?.orZero() ?? ZERO,
          this.qualificationTypeId?.orZero() ?? ZERO,
          this.employeeId?.orZero() ?? ZERO,
          this.isValid?.orfalse()?? FALSE,
          this.message.orEmpty()?? EMPTY);
    }
  }
extension skillsResponseMapper  on SkillsResponse {
  skillsModel toDomain() {
    return skillsModel(
        this.id?.orZero() ?? ZERO,
        this.typeName?.orEmpty() ?? EMPTY,
        this.gradeName?.orEmpty() ?? EMPTY,
        this.qualificationTypeId?.orZero() ?? ZERO,
        this.date?.orEmpty() ?? EMPTY,
        this.gradeId?.orZero() ?? ZERO);
  }
}

//____________for save(post on api)____________
//______--from model to response_________________
extension skillsSaveMapper on SaveEmpSkillsModel{
  saveEmpSkillsResponse  toResponse()
  { return saveEmpSkillsResponse(
    this.userId.orEmpty()?? EMPTY,
    this.date.orEmpty()?? EMPTY,
    this.gradeId.orZero()??ZERO,
    this.qualificationTypeId.orZero()??ZERO,
    this.employeeId.orZero()??ZERO
  );

  }
}
//-----------------------------------------------
extension getEmpSkillsResponseMapper  on GetEmpSkillsResponse {

  getEmpSkillsModel toDomain(){
  List<skillsModel> mappedskills=
  (this.skillData?.map((skill) => skill.toDomain()) ??
          Iterable.empty()).cast<skillsModel>()
        .toList();
    bool mappedAllowEdit = this.allowEdit?.orfalse()?? false;
    var empSkillsData=getEmpSkillsModel(mappedskills,mappedAllowEdit);
    return empSkillsData;

  }
}

//_____________________________AcademicDegree__________________
extension EmpAcademicDegreeResponseMapper  on saveAcademicDegreeResponse {
  SaveAcademicDegreeModel toDomain() {
    return SaveAcademicDegreeModel(
      this.userId?.orEmpty() ?? EMPTY,
      this.id?.orZero() ?? ZERO,
      this.major?.orEmpty() ?? EMPTY,
      this.university?.orEmpty() ?? EMPTY,
      this.notes?.orEmpty() ?? EMPTY,
      this.gradeId?.orZero() ?? ZERO,
      this.academicDegreeTypeId?.orZero() ?? ZERO,
      this.gradeId?.orZero() ?? ZERO,
      this.degreeDate?.orEmpty() ?? EMPTY,
      //this.?.orZero() ?? ZERO
    );
  }
}
extension AcademicDegreeResponseMapper  on AcademicDegreeResponse {
 AcademicDegreeModel toDomain() {

    return AcademicDegreeModel(
        this.id?.orZero() ?? ZERO,
        this.typeName?.orEmpty() ?? EMPTY,
        this.gradeName?.orEmpty() ?? EMPTY,
        this.academicDegreeTypeId?.orZero() ?? ZERO,
        this.degreeDate?.orEmpty() ?? EMPTY,
        this.gradeId?.orZero() ?? ZERO,
        this.major?.orEmpty() ?? EMPTY,
        this.universitye?.orEmpty() ?? EMPTY,
    );
  }
}
extension getAcademicDegreeResponseMapper  on GetAcademicDegreeResponse {

  getAcademicDegreeModel toDomain(){
    List<AcademicDegreeModel> mappedAcademicDegree=
    (this.academicDegreeData?.map((academicDegree) => academicDegree.toDomain()) ??
        Iterable.empty()).cast<AcademicDegreeModel>()
        .toList();
    bool mappedAllowEdit = this.allowEdit?.orfalse()?? false;
    var empAcademicDegreeData=getAcademicDegreeModel (mappedAcademicDegree,mappedAllowEdit);
    return empAcademicDegreeData;

  }
}

//_____________________________Qualification________________________
extension QualificationResponseMapper  on QualificationItemResponse {
  QualificationItem toDomain() {
    return QualificationItem(
        this.value?.orZero() ?? ZERO,
        this.text?.orEmpty() ?? EMPTY,
);
  }
}
extension QualificationsResponseMapper  on QualificationsResponse {

  QualificationsObject toDomain(){
    List<QualificationItem> mappedQualifications=
    (this.data?.map((q) => q.toDomain()) ??
        Iterable.empty()).cast<QualificationItem>()
        .toList();
    var QualificationsData=QualificationsObject(mappedQualifications);
    return QualificationsData;

  }
}
//_____________________________Grade________________________
extension GradeItemResponseMapper  on GradeItemResponse {
  GradeItem toDomain() {
    return GradeItem(
      this.value?.orZero() ?? ZERO,
      this.text?.orEmpty() ?? EMPTY,
    );
  }
}
extension GradesResponseMapper  on GradesResponse {

  GradesObject toDomain(){
    List<GradeItem> mappedGrades=
    (this.data?.map((g) => g.toDomain()) ??
        Iterable.empty()).cast<GradeItem>()
        .toList();
    var GradeData= GradesObject(mappedGrades);
    return GradeData;

  }
}
///////////////////////////////////////////////////////////////////

//_____________________________Grade________________________
extension AcademicItemResponseMapper  on AcademicItemResponse {
  DegreeItem toDomain() {
    return DegreeItem(
      this.value?.orZero() ?? ZERO,
      this.text?.orEmpty() ?? EMPTY,
    );
  }
}
extension AcademicResponseMapper  on AcademicResponse {

  DegreeObject toDomain(){
    List<DegreeItem> mappedDegree=
    (this.data?.map((g) => g.toDomain()) ??
        Iterable.empty()).cast<DegreeItem>()
        .toList();
    var AcademicData= DegreeObject(mappedDegree);
    return AcademicData;

  }
}




////////////////////////////////////////////////////////////////////////////////////


/////////////display vacation//////////////////////////

extension VacationResponseMapper on VacationItemResponse?{
  Vacation toDomain() {
    return Vacation(
        this?.employeeName?.orEmpty() ?? EMPTY,
        this?.employeeId?.orZero() ?? ZERO,
        this?.employeeCode?.orEmpty() ?? EMPTY,
        this?.VacationTypeName?.orEmpty() ?? EMPTY,
        this?.VacationTypeDuration?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.Transferred?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.Total?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.Consumed?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.Available?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.Pending?.ordoubleZero() ?? DOUBLE_ZERO,);
  }

}

extension vacationsResponseMapper on VacationsResponse?
{
  VacationsObject toDomain()
  {
    List<Vacation> vacations=
    (this?.data?.
    map((vacation) =>vacation.toDomain())??
        Iterable.empty()) // empty list for kind of vacation( Iterable.empty())
        .cast<Vacation>()
        .toList();
    var data = VacationsData (vacations);
    return VacationsObject(data);
  }

}









extension VacationItemTypeResponseMapper on VacationTypeItemResponse?{
  VacationTypeItem toDomain() {
    return VacationTypeItem(
      this?.id?.orZero() ?? ZERO,
      this?.name?.orEmpty() ?? EMPTY,
     );
  }

}

extension vacationTypeResponseMapper on VacationTypeResponse?
{
  VacationTypeObject toDomain()
  {
    List<VacationTypeItem> vacationType=
    (this?.data.
    map((vacationType) =>vacationType.toDomain())??
        Iterable.empty()) // empty list for kind of vacation( Iterable.empty())
        .cast<VacationTypeItem>()
        .toList();
    var data = VacationType (vacationType);
    return VacationTypeObject(data);
  }

}
///////////////salary////////////////////////////////
extension SalaryItemResponseMapper on SalaryItemResponse?{
  SalaryItems toDomain() {
    return SalaryItems(
      this?.id?.orZero() ?? ZERO,
      this?.monthName?.orEmpty() ?? EMPTY,
      this?.salaryValue?.ordoubleZero() ?? DOUBLE_ZERO);
  }
}

extension SalaryResponseMapper on SalaryResponse?
{
  SalaryObject toDomain()
  {
    List<SalaryItems> salary=
    (this?.data?.
    map((salary) => salary.toDomain())??
        const Iterable.empty())
        .cast<SalaryItems>()
        .toList();
    var data =SalaryData (salary);
    return SalaryObject(data);
  }

}
///////////////////////////////salaryDetails///////////////////


extension SalaryDetailsResponseMapper on SalaryDetailsResponse
{
  SalaryDetailsObject toDomain(){
    String mappedEmpName=this.employeeName.orEmpty()?? EMPTY;
    String mappedMonth=this.month.orEmpty()?? EMPTY;
    List<Benefit> mappedBenefit =
    (this.benefitItems?.map((benefit) => benefit.toDomain()) ??
        Iterable.empty())
        .cast<Benefit>()
        .toList();
    List<Deducted> mappedDeducted=
    (this.deductedItems?.map((item) => item.toDomain()) ??
        Iterable.empty())
        .cast<Deducted>()
        .toList();
    double? mappedtotalBenefits=this.totalBenefits?.ordoubleZero()?? DOUBLE_ZERO;
    double? mappedtotalDeductions=this.totalDeducted?.ordoubleZero()?? DOUBLE_ZERO;
    List<dynamic>? mappedpaySlipItems=this.paysLipItems;
    double? mappedNetSalary=this.netSalary?.ordoubleZero()?? DOUBLE_ZERO;
    double? mappedMax=this.max?.ordoubleZero()?? DOUBLE_ZERO;
    bool? mappedhideNetSalary=this.hideNetSalary?.orfalse()?? FALSE;
var data=SalaryDetails(mappedEmpName,mappedMonth,mappedBenefit,
mappedDeducted,mappedtotalBenefits,mappedtotalDeductions,
mappedpaySlipItems,mappedNetSalary,mappedMax,mappedhideNetSalary);
return SalaryDetailsObject(data);

  }


}
extension AttendanceItemResponseMapper on AttendanceItemResponse? {
  Attendance toDomain() {
    return Attendance(this?.id?.orZero() ?? ZERO, this?.mode?.orEmpty() ?? EMPTY,
        this?.action?.orEmpty() ?? EMPTY, this?.actionTime?.orDateTimeNull() ?? DT_EMPTY);
  }
}

extension AttendanceResponseMapper on AttendanceResponse? {
  AttendanceObject toDomain() {
    List<Attendance> mappedAttendance =
    (this?.attendance?.map((attendance) => attendance.toDomain()) ??
        Iterable.empty())
        .cast<Attendance>()
        .toList();
    var data = AttendanceList(mappedAttendance);
    return AttendanceObject(data);
  }
}


extension BenfitResponseMapper on BenefitItemResponse?
{
  Benefit toDomain() {
    return Benefit(this?.value?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.ItemName?.orEmpty() ?? EMPTY,
        this?.showOnPaySlip?.orfalse()?? FALSE);
  }
}

extension DeductedResponseMapper on DeductedItemResponse?
{
  Deducted toDomain() {
    return Deducted(this?.value?.ordoubleZero() ?? DOUBLE_ZERO,
        this?.ItemName?.orEmpty() ?? EMPTY,
        this?.showOnPaySlip?.orfalse()?? FALSE);
  }
}



