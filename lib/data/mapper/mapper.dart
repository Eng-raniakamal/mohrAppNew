import 'package:mohr_hr/application/extensions.dart';

// to convert the response into a non nullable object (model)

import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;
const  double DOUBLE_ZERO = 0.0;
const FALSE = false;

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
        this?.arabicName?.orEmpty() ?? EMPTY,
        this?.englishName?.orEmpty() ?? EMPTY,
        this?.birthDate?.orEmpty() ?? EMPTY,
        this?.nationalId?.orEmpty() ?? EMPTY,
        this?.socialId?.orEmpty() ?? EMPTY,
        this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY,
        this?.emergencyNumber?.orEmpty() ?? EMPTY
    );
  }
}


extension AddressResponseMapper on AddressResponse? {
  AddressModel toDomain() {
    return AddressModel(
        this?.addressText?.orEmpty() ?? EMPTY,
        this?.districtId?.orZero() ?? ZERO,
        this?.pOBox?.orEmpty() ?? EMPTY,
        this?.zipCode?.orEmpty() ?? EMPTY,
    );
  }
}


extension EmployeeBasicDataResponseMapper  on EmployeeBasicDataResponse {
  EmployeeBasicDataModel toDomain() {
    return EmployeeBasicDataModel(
        this.UserId?.orEmpty() ?? EMPTY,
        this.Employee?.toDomain(),
        this.Address?.toDomain(),
    );
  }
}
//------skills-----------------------------
  extension EmployeeSkillsResponseMapper  on EmployeeSkillsResponse {
    EmployeeSkillsModel toDomain() {
      return EmployeeSkillsModel(
          this.userId?.orEmpty() ?? EMPTY,
          this.date?.orEmpty() ?? EMPTY,
          this.gradeId?.orZero() ?? ZERO,
          this.qualificationTypeId?.orZero() ?? ZERO,
          this.employeeId?.orZero() ?? ZERO);
    }
  }

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
  // extension vacationsResponseMapper on VacationsResponse?
  // {
  //   VacationsResponse toDomain()
  // {
  // return VacationsResponse(this?.data);
  // }




