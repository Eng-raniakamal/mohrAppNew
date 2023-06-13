
import 'dart:async';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/dio_factory.dart';
import '../../../domain/usecase/empBD_useCase.dart';
import '../../Base/baseviewmodel.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../common/freezed_data_classes.dart';
import '../../common/state_renderer/state_renderer.dart';

class EmployeeBDViewModel extends BaseViewModel
    with EmployeeBDViewModelInputs,EmployeeBDViewModelOutputs
{
  StreamController ArabicNameStreamController=
      StreamController<String>.broadcast();
  StreamController EnglishNameStreamController=
  StreamController<String>.broadcast();
  StreamController BirthDateStreamController=
  StreamController<String>.broadcast();
  StreamController NationalIdStreamController=
  StreamController<String>.broadcast();
  StreamController SocialIdStreamController=
  StreamController<String>.broadcast();
  StreamController EmailStreamController=
  StreamController<String>.broadcast();
  StreamController PhoneStreamController=
  StreamController<String>.broadcast();
  StreamController EmergencyStreamController=
  StreamController<String>.broadcast();
  StreamController AddressTextStreamController=
  StreamController<String>.broadcast();
  StreamController DistrictIdStreamController=
  StreamController<int>.broadcast();
  StreamController POBoxStreamController=
  StreamController<String>.broadcast();
  StreamController ZipCodeStreamController=
  StreamController<String>.broadcast();
  StreamController areAllInputsValidStreamController=
  StreamController<void>.broadcast();

  final EmployeeBasicDataUseCase _EmpBDUseCase;

  var EmployeeDBObject= empBasicDataObject(UserId,"","","",
  "","","","","","",0,"","");

  EmployeeBDViewModel(this._EmpBDUseCase);


//--input

  @override
  Sink get inputArabicName => ArabicNameStreamController.sink;
  @override
  Sink get inputEnglishName => EnglishNameStreamController.sink;
  @override
  Sink get inputBirthDate => BirthDateStreamController.sink;
  @override
  Sink get inputNationalId => NationalIdStreamController.sink;
  @override
  Sink get inputSocialId => SocialIdStreamController.sink;
  @override
  Sink get inputEmail => EmailStreamController.sink;
  @override
  Sink get inputPhone => PhoneStreamController.sink;
  @override
  Sink get inputEmergencyNumber => EmergencyStreamController.sink;

  @override
  Sink get inputAddressText=> AddressTextStreamController.sink;
  @override
  Sink get inputDistrictId => DistrictIdStreamController.sink;
  @override
  Sink get inputPOBox => POBoxStreamController.sink;
  @override
  Sink get inputZipCode => ZipCodeStreamController.sink;


  @override
  void start() {
    inputState.add(ContentState());

  }

  @override
  void dispose()
  {
    ArabicNameStreamController.close();
    EnglishNameStreamController.close();
    BirthDateStreamController.close();
    NationalIdStreamController.close();
    SocialIdStreamController.close();
    EmailStreamController.close();
    PhoneStreamController.close();
    EmergencyStreamController.close();
    AddressTextStreamController.close();
    DistrictIdStreamController.close();
    POBoxStreamController.close();
    ZipCodeStreamController.close();

    areAllInputsValidStreamController.close();
    super.dispose();
  }


//Outputs//////////////////////////////////////////////////////////

  @override
  // Stream<String> get outputIsAddressTextValid =>
  //     outputIsAddressTextValid.map((isAddressTextValid)=> isAddressValid ? null :"Invalide" ;
  //
  @override
  Stream<bool> get outputIsArabicNameValid =>
      ArabicNameStreamController.stream.map(
              (arabicName) => _isArabicNameValid(arabicName));


  @override
  Stream<bool> get outputIsEnglishNameValid =>
      EnglishNameStreamController.stream.map(
              (englishName) => _isEnglishNameValid(englishName));

  @override
  Stream<bool> get outputIsBirthDateValid =>
      BirthDateStreamController.stream.map(
              (birthDate) => _isBirthDateValid(birthDate));

  @override
  Stream<bool> get outputIsNationalIdValid =>
      NationalIdStreamController.stream.map(
              (nationalId) => _isNationalIdValid(nationalId));

  @override
  Stream<bool> get outputSocialIdValid =>
      SocialIdStreamController.stream.map(
              (socialId) => _isSocialIdValid(socialId));

  @override
  Stream<bool> get outputEmailValid =>
      EmailStreamController.stream.map(
              (email) => _isEmailValid(email));


  @override
  Stream<bool> get outputPhoneValid =>
      PhoneStreamController.stream.map(
              (Phone) => _isPhoneValid(Phone));

  @override
  Stream<bool> get outputEmergencyNumberValid =>
      EmergencyStreamController.stream.map(
              (emergency_Number) => _isEmergencyValid(emergency_Number));
  @override
  Stream<bool> get outputAddressTextValid =>
      AddressTextStreamController.stream.map(
              (AddressText) => _isAddressTextValid(AddressText));


  @override
  Stream<bool> get outputDistrictIdValid =>
      DistrictIdStreamController.stream.map(
              (DistrictId) => _isDistrictIdValid(DistrictId));


  @override
  Stream<bool> get outputPOBoxValid =>
      POBoxStreamController.stream.map(
              (POBox) => _isPOBoxValid(POBox));


  @override
  Stream<bool> get outputZipCodeValid =>
      ZipCodeStreamController.stream.map(
              (ZipCode) => _isZipCodeValid(ZipCode));

  @override
  // TODO: implement outputIsAddressTextValid
  Stream<bool> get outputIsAddressTextValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsDistrictIdValid
  Stream<bool> get outputIsDistrictIdValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsEmailValid
  Stream<bool> get outputIsEmailValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsEmergencyValid
  Stream<bool> get outputIsEmergencyValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsPhoneValid
  Stream<bool> get outputIsPhoneValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsSocialIdValid
  Stream<bool> get outputIsSocialIdValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsZipCodeValid
  Stream<bool> get outputIsZipCodeValid => throw UnimplementedError();

  @override
  setAddressText(String addressText) {
    if(_isAddressTextValid(addressText))
    {EmployeeDBObject=EmployeeDBObject.copyWith(AddressText: addressText);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith(AddressText: addressText);
    }
  }

  @override
  setArabicName(String arabicName) {
    if(_isArabicNameValid(arabicName))
    {EmployeeDBObject=EmployeeDBObject.copyWith(ArabicName: arabicName);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith(ArabicName: arabicName);
    }
  }

  @override
  setEnglishName(String  englishName) {
    if(_isEnglishNameValid( englishName))
    {EmployeeDBObject=EmployeeDBObject.copyWith( EnglishName:  englishName);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( EnglishName:  englishName);
    }
  }

  @override
  setBirthDate(String birthDate) {
    if(_isBirthDateValid( birthDate))
    {EmployeeDBObject=EmployeeDBObject.copyWith( BirthDate: birthDate);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( BirthDate:  birthDate);
    }
  }


  @override
  setNationalId(String nationalId) {
    if(_isNationalIdValid(nationalId))
    {EmployeeDBObject=EmployeeDBObject.copyWith( NationalId: nationalId);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( NationalId: nationalId);
    }
  }


  @override
  setSocialId(String socialId) {
    if(_isSocialIdValid(socialId))
    {EmployeeDBObject=EmployeeDBObject.copyWith( SocialId: socialId);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( SocialId: socialId);
    }
  }

  @override
  setDistrictId (int districtId) {
    if(_isDistrictIdValid(districtId))
    {EmployeeDBObject=EmployeeDBObject.copyWith( DistrictId: districtId);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( DistrictId: districtId);
    }
  }

  @override
  setEmail(String email) {
    if(_isEmailValid(email))
    {EmployeeDBObject=EmployeeDBObject.copyWith( Email: email);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( Email: email);
    }
  }

  @override
  setEmergencyNumber(String emergencyNumber) {
    if(_isEmergencyValid(emergencyNumber))
    {EmployeeDBObject=EmployeeDBObject.copyWith( Emergency_Number: emergencyNumber);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( Emergency_Number: emergencyNumber);
    }
  }



  @override
  setPOBox(String pOBox) {
    if(_isPOBoxValid(pOBox))
    {EmployeeDBObject=EmployeeDBObject.copyWith( PoBox: pOBox);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( PoBox: pOBox);
    }
  }

  @override
  setPhone(String phone) {
    if(_isPhoneValid(phone))
    {EmployeeDBObject=EmployeeDBObject.copyWith( Phone: phone);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( Phone: phone);
    }
  }


  @override
  setZipCode(String zipCode) {
    if(_isZipCodeValid(zipCode))
    {EmployeeDBObject=EmployeeDBObject.copyWith( ZipCode: zipCode);   }
    else{
      EmployeeDBObject=EmployeeDBObject.copyWith( ZipCode: zipCode);
    }
  }

  @override
  addBasicData() async{
    EmployeeDBObject.userID;


    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _EmpBDUseCase.execute(
         EmployeeBasicDataUseCaseInput(
             EmployeeDBObject.userID,
             EmployeeDBObject.ArabicName,
             EmployeeDBObject.EnglishName,
             EmployeeDBObject.BirthDate,
             EmployeeDBObject.NationalId,
             EmployeeDBObject.SocialId,
             EmployeeDBObject.Email,
             EmployeeDBObject.Phone,
             EmployeeDBObject.Emergency_Number,
             EmployeeDBObject.AddressText,
             EmployeeDBObject.DistrictId,
             EmployeeDBObject.PoBox,
             EmployeeDBObject.ZipCode
           )
    ))
        .fold((failure) => {inputState.add(
        ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message)),

    },(data)
    {
      inputState.add(ContentState());
    });


  }


}
//////////////////////////////////////////////////////////////////////////////////////
//--Private functions
bool _isArabicNameValid(String arabicName){
  return arabicName!=null ;
}
bool _isEnglishNameValid(String englishName){
  return englishName!=null ;
}
bool _isBirthDateValid(String birthDate){
  return birthDate!=null ;
}
bool _isNationalIdValid(String NationalId){
  return NationalId!=null ;
}
bool _isSocialIdValid(String SocialId){
  return SocialId!=null ;
}
bool _isEmailValid(String Email){
  return Email!=null ;
}
bool _isPhoneValid(String Phone){
  return Phone!=null ;
}
bool _isEmergencyValid(String emergencyNumber) {
  return emergencyNumber != null;
}

bool _isAddressTextValid(String AddressText) {
  return AddressText != null;
}

  bool _isDistrictIdValid(int DistrictId) {
    return DistrictId >0;
  }
    bool _isPOBoxValid(String POBox) {
      return POBox != null;
    }
bool _isZipCodeValid(String ZipCode) {
  return ZipCode != null;
}
////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////
abstract class EmployeeBDViewModelInputs
{
  Sink get inputArabicName;
  Sink get inputEnglishName;
  Sink get inputBirthDate;
  Sink get inputNationalId;
  Sink get inputSocialId;
  Sink get inputEmail;
  Sink get inputPhone;
  Sink get inputEmergencyNumber;
  Sink get inputAddressText;
  Sink get inputDistrictId;
  Sink get inputPOBox;
  Sink get inputZipCode;
  setArabicName(String arabicName);
  setEnglishName(String englishName);
  setBirthDate(String birthDate);
  setNationalId(String nationalId);
  setSocialId(String socialId);
  setEmail(String email);
  setPhone(String phone);
  setEmergencyNumber(String emergencyNumber);
  setAddressText(String addressText);
  setDistrictId(int districtId);
  setPOBox(String pOBox);
  setZipCode(String zipCode);
  addBasicData();

}
abstract class EmployeeBDViewModelOutputs
{
  Stream<bool>get outputIsArabicNameValid;
  Stream<bool>get outputIsEnglishNameValid;
  Stream<bool>get outputIsBirthDateValid;
  Stream<bool>get outputIsNationalIdValid;
  Stream<bool>get outputIsSocialIdValid;
  Stream<bool>get outputIsEmailValid;
  Stream<bool>get outputIsPhoneValid;
  Stream<bool>get outputIsEmergencyValid;
  Stream<bool>get outputIsAddressTextValid;
  Stream<bool>get outputIsDistrictIdValid;
  Stream<bool>get outputIsZipCodeValid;

}
