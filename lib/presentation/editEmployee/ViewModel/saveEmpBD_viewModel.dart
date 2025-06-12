
import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/data/networks/dio_factory.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/saveEmpBD_useCase.dart';
import 'package:essmohr/presentation/User/User_viewModel.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import '../../../data/networks/failure.dart';
import '../../Base/baseviewmodel.dart';
import '../../common/state_renderer/state_render_impl.dart';


// class saveBDViewModel extends BaseViewModel implements saveBDViewModelInputs,saveBDViewModelOutputs
// {
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   //the steamcontroller has many listener
//   StreamController ArabicNameStreamController =
//   StreamController<String>.broadcast();
//   StreamController EnglishNameStreamController =
//   StreamController<String>.broadcast();
//   StreamController BirthDateStreamController =
//   StreamController<String>.broadcast();
//   StreamController NationalIdStreamController =
//   StreamController<String>.broadcast();
//   StreamController SocialIdStreamController =
//   StreamController<String>.broadcast();
//   StreamController EmailStreamController =
//   StreamController<String>.broadcast();
//   StreamController PhoneStreamController =
//   StreamController<String>.broadcast();
//   StreamController EmergencyStreamController =
//   StreamController<String>.broadcast();
//   StreamController AddressTextStreamController =
//   StreamController<String>.broadcast();
//   StreamController DistrictIdStreamController =
//   StreamController<int>.broadcast();
//   StreamController POBoxStreamController =
//   StreamController<String>.broadcast();
//   StreamController ZipCodeStreamController =
//   StreamController<String>.broadcast();
//   StreamController areAllInputsValidStreamController =
//   StreamController<void>.broadcast();
//
//    saveEmpBasicDataUseCase _EmpBDUseCase;
// String userId;
// EmployeeSaveModel? employee;
//  AddressModel? address;
//   var employeeObject =EmployeeSaveModel(0,"","","","","","","","");
//   var addressObject =AddressSaveModel("",0,"","");
//   var empSaveBasicDataObject;
//
//   // String? ArabicName;
//   // String? EnglishName;
//   // String? BirthDate;
//   // String? NationalId;
//   // String? SocialId;
//   // String? Email;
//   // String? Phone;
//   // String? Emergency_Number;
//   // String? AddressText;
//   // int? DistrictId;
//   // String? PoBox;
//   // String? ZipCode;
//   saveBDViewModel(this._EmpBDUseCase,this.userId);
// //--input
//   @override
//   void start() {
//     inputState.add(ContentState());
//   }
//
//   @override
//   SaveBasicData(int empId,String arabicName,
//       String englishName,String birthDate,String nationalId,String socialId,String email,String phone,
//       String emergencyNumber,String addressText,int districtId,String poBox,String ZipCode) async {
//     userId=await _appPreferences.getUserToken();
//     employeeObject=EmployeeSaveModel(empId,arabicName, englishName, birthDate, nationalId, socialId,
//        email, phone, emergencyNumber);
//     addressObject=AddressSaveModel(addressText, districtId, poBox, ZipCode);
//     //userObject.userID;
//   //  empSaveBasicDataObject=EmpBasicDataSaveObject(userId,employeeObject,addressObject);
//
//   inputState.add(
//       LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
//   (await _EmpBDUseCase.execute(
//       saveEmpBasicDataUseCaseInput(userId,
//           employeeObject,
//           addressObject)
//   ))
//   //it's function inside either return left ana right
//       .fold((failure) =>
//   {
//     inputState.add(
//   SuccessState(failure.message)),
//       //ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)),
//
//   }, (data) {
//         print(data.employee?.arabicName!);
//     inputState.add(ContentState());
//   });
// }
//
// @override
// void dispose(){
//      ArabicNameStreamController.close();
//      EnglishNameStreamController.close();
//      BirthDateStreamController.close();
//      NationalIdStreamController.close();
//      SocialIdStreamController.close();
//      EmailStreamController.close();
//      PhoneStreamController.close();
//      EmergencyStreamController.close();
//      AddressTextStreamController.close();
//      DistrictIdStreamController .close();
//      POBoxStreamController.close();
//      ZipCodeStreamController.close();
//      areAllInputsValidStreamController.close();
//      super.dispose();
// }
//
//   @override
//   Sink get inputArabicName => ArabicNameStreamController.sink;
//
//   @override
//   Sink get inputEnglishName => EnglishNameStreamController.sink;
//
//   @override
//   Sink get inputBirthDate => BirthDateStreamController.sink;
//   @override
//   Sink get inputNationalId => NationalIdStreamController.sink;
//
//   @override
//   Sink get inputSocialId => SocialIdStreamController.sink;
//
//   @override
//   Sink get inputEmail => EmailStreamController.sink;
//
//   @override
//   Sink get inputPhone => PhoneStreamController.sink;
//
//   @override
//   Sink get inputEmergencyNumber => EmergencyStreamController.sink;
//
//   @override
//   Sink get inputAddressText => AddressTextStreamController.sink;
//
//   @override
//   Sink get inputDistrictId => DistrictIdStreamController.sink;
//
//   @override
//   Sink get inputPOBox => POBoxStreamController.sink;
//
//   @override
//   Sink get inputZipCode => ZipCodeStreamController.sink;
//
//
// //Outputs//////////////////////////////////////////////////////////
//
//
//   @override
//   Stream<String> get outputIsArabicNameValid =>
//       ArabicNameStreamController.stream.map(
//               (arabicName) => _isArabicNameValid(arabicName));
//
//
//   @override
//   Stream<String> get outputIsEnglishNameValid =>
//       EnglishNameStreamController.stream.map(
//               (englishName) => _isEnglishNameValid(englishName));
//
//   @override
//   Stream<String> get outputIsBirthDateValid =>
//       BirthDateStreamController.stream.map(
//               (birthDate) => _isBirthDateValid(birthDate));
//
//   @override
//   Stream<String> get outputIsNationalIdValid =>
//       NationalIdStreamController.stream.map(
//               (nationalId) => _isNationalIdValid(nationalId));
//
//   Stream<String> get outputSocialIdValid =>
//       SocialIdStreamController.stream.map(
//               (socialId) => _isSocialIdValid(socialId));
//
//   @override
//   Stream<String> get outputEmailValid =>
//       EmailStreamController.stream.map(
//               (email) => _isEmailValid(email));
//
//
//   @override
//   Stream<String> get outputPhoneValid =>
//       PhoneStreamController.stream.map(
//               (Phone) => _isPhoneValid(Phone));
//
//   @override
//   Stream<bool> get outputEmergencyNumberValid =>
//       EmergencyStreamController.stream.map(
//               (emergency_Number) => _isEmergencyValid(emergency_Number));
//
//   @override
//   Stream<bool> get outputAddressTextValid =>
//       AddressTextStreamController.stream.map(
//               (AddressText) => _isAddressTextValid(AddressText));
//
//
//   @override
//   Stream<bool> get outputDistrictIdValid =>
//       DistrictIdStreamController.stream.map(
//               (DistrictId) => _isDistrictIdValid(DistrictId));
//
//
//   @override
//   Stream<bool> get outputPOBoxValid =>
//       POBoxStreamController.stream.map(
//               (POBox) => _isPOBoxValid(POBox));
//
//
//   @override
//   Stream<bool> get outputZipCodeValid =>
//       ZipCodeStreamController.stream.map(
//               (ZipCode) => _isZipCodeValid(ZipCode));
//
//   @override
//   setAddressText(String addressText) {
//     if(addressText.isNotEmpty){
//       //addressObject=addressObject.copyWith(AddressText: addressText);
//     }
//
//     // inputAddressText.add(addressText);
//     // if (_isAddressTextValid(addressText)) {
//     //  // EmployeeDBObject.address.addressText = addressText;
//     // }
//     else {
//      // addressObject=addressObject.copyWith(AddressText:"");
//     }
//   }
//
//   @override
//    setArabicName(String arabicName) {
//      inputArabicName.add(arabicName);
//     // if (_isArabicNameValid(arabicName) != null) {
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(ArabicName: arabicName);
//     //  // EmployeeDBObject.employee.arabicName = arabicName;
//     // }
//     // else {
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(ArabicName: arabicName);
//     // }
//     if (arabicName.isNotEmpty) {
//      // employeeObject = employeeObject.copyWith(ArabicName: arabicName);
//     } else {
//      // employeeObject = employeeObject.copyWith(ArabicName: "");
//     }
//
//
//     // inputAddressText.add(addressText);
//     // if (_isAddressTextValid(addressText)) {
//     //  // EmployeeDBObject.address.addressText = addressText;
//     // }
//     // else {
//     //   addressObject=addressObject.copyWith(AddressText: addressText);
//     // }
//   }
//
//   @override
//   setEnglishName(String englishName) {
//
//     if (englishName.isNotEmpty) {
//      // employeeObject = employeeObject.copyWith(EnglishName: englishName);
//     } else {
//     //  employeeObject = employeeObject.copyWith(EnglishName: "");
//     }
//
//     // inputEnglishName.add(englishName);
//     // if (_isEnglishNameValid(englishName) != null) {
//     //  // EmployeeDBObject.employee.englishName = englishName;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(EnglishName: englishName);
//     // }
//     // else {
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(EnglishName: englishName);
//     // }
//   }
//
//   @override
//   setBirthDate(String birthDate) {
//     if (birthDate.isNotEmpty) {
//      // employeeObject = employeeObject.copyWith(BirthDate: birthDate);
//     } else {
//      // employeeObject = employeeObject.copyWith(BirthDate: "");
//     }
//
//
//
//     // inputBirthDate.add(birthDate);
//     // if (_isBirthDateValid(birthDate) != null) {
//     //  // EmployeeDBObject.employee.birthDate = birthDate;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(BirthDate: birthDate);
//     // }
//     // else {
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(BirthDate: birthDate);
//     // }
//   }
//
//   @override
//   setNationalId(String nationalId) {
//
//     if (nationalId.isNotEmpty) {
//      // employeeObject = employeeObject.copyWith(NationalId: nationalId);
//     } else {
//      // employeeObject = employeeObject.copyWith(NationalId: "");
//     }
//
//     // inputNationalId.add(nationalId);
//     // if (_isNationalIdValid(nationalId) != null) {
//     // //  EmployeeDBObject.employee.nationalId = nationalId;
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(NationalId: nationalId);
//     // }
//     // else {
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(NationalId: nationalId);
//     // }
//   }
//
//   @override
//   setSocialId(String socialId) {
//     if (socialId.isNotEmpty) {
//     //  employeeObject = employeeObject.copyWith(SocialId: socialId);
//     } else {
//      // employeeObject = employeeObject.copyWith(SocialId: "");
//     }
//
//     // inputSocialId.add(socialId);
//     // if (_isSocialIdValid(socialId) != null) {
//     // //  EmployeeDBObject.employee.socialId = socialId;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(SocialId: socialId);
//     // }
//     // else {
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(SocialId: socialId);
//     // }
//   }
//
//   @override
//   setDistrictId(int districtId) {
//     if(districtId !=0){
//      // addressObject=addressObject.copyWith(DistrictId: districtId);
//     }
//
//     else {
//      // addressObject=addressObject.copyWith(DistrictId:0);
//     }
//   }
//
//     // inputDistrictId.add(districtId);
//     // if (_isDistrictIdValid(districtId)) {
//     // //  EmployeeDBObject.address.districtId = districtId;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(DistrictId: districtId);
//     // }
//     // else {
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(DistrictId: districtId);
//     // }
//   //}
//
//   @override
//    setEmail(String email) {
//     //
//     if (email.isNotEmpty) {
//        //employeeObject = employeeObject.copyWith(Email: email);
//     } else {
//       // employeeObject = employeeObject.copyWith(Email: "");
//     }
//   }
//   //
//   //   // inputEmail.add(email);
//   //   // if (_isEmailValid(email) != null) {
//   //   //  // EmployeeDBObject.employee.email = email;
//   //   //  // EmployeeDBObject = EmployeeDBObject.copyWith(Email: email);
//   //   // }
//   //   // else {
//   //   //   //EmployeeDBObject = EmployeeDBObject.copyWith(Email: email);
//   //   // }
//   //
//   // }
//
//   @override
//   setEmergencyNumber(String emergencyNumber) {
//     if (emergencyNumber.isNotEmpty) {
//       // employeeObject = employeeObject.copyWith(Emergency_Number: emergencyNumber);
//     } else {
//       // employeeObject = employeeObject.copyWith(Emergency_Number: "");
//     }
//   }
//     // inputEmergencyNumber.add(emergencyNumber);
//     // if (_isEmergencyValid(emergencyNumber)) {
//     //
//     //      // EmployeeDBObject.employee.emergency_Number = emergencyNumber;
//     //       //EmployeeDBObject.copyWith(Emergency_Number: emergencyNumber);
//     // }
//     // else {
//     //   // EmployeeDBObject =
//     //   //     EmployeeDBObject.copyWith(Emergency_Number: emergencyNumber);
//     // }
//  // }
//   @override
//   setPOBox(String pOBox) {
//
//     if (pOBox.isNotEmpty) {
//       // addressObject = addressObject.copyWith(PoBox: pOBox);
//     } else {
//       // addressObject = addressObject.copyWith(PoBox: "");
//     }
//   }
//     // inputPOBox.add(pOBox);
//     // if (_isPOBoxValid(pOBox)) {
//     //
//     //  // EmployeeDBObject.address.poBox = pOBox;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(PoBox: pOBox);
//     // }
//     // else {
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(PoBox: pOBox);
//     // }
//   @override
//   setPhone(String phone) {
//     if (phone.isNotEmpty) {
//       // employeeObject = employeeObject.copyWith(Phone: phone);
//     } else {
//       // employeeObject = employeeObject.copyWith(Phone: "");
//     }
//   }
//     // inputPhone.add(phone);
//     // if (_isPhoneValid(phone) != null) {
//     // //  EmployeeDBObject.employee.phone = phone;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(Phone: phone);
//     // }
//     // else {
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(Phone: phone);
//     // }
//  // }
//
//   @override
//   setZipCode(String zipCode) {
//     if (zipCode.isNotEmpty) {
//       // addressObject = addressObject.copyWith(ZipCode: zipCode);
//     } else {
//       // addressObject = addressObject.copyWith(ZipCode: "");
//     }
//     // inputZipCode.add(zipCode);
//     // if (_isZipCodeValid(zipCode)) {
//     // //  EmployeeDBObject.address.zipCode = zipCode;
//     //   //EmployeeDBObject = EmployeeDBObject.copyWith(ZipCode: zipCode);
//     // }
//     // else {
//     //  // EmployeeDBObject = EmployeeDBObject.copyWith(ZipCode: zipCode);
//     // }
//   }
//
//
// //////////////////////////////////////////////////////////////////////////////////////
// //--Private functions
//   String _isArabicNameValid(String arabicName) {
//     return arabicName = "";
//   }
//
//   String _isEnglishNameValid(String englishName) {
//     return englishName = "";
//   }
//
//   String _isBirthDateValid(String birthDate) {
//     return birthDate = "";
//   }
//
//   String _isNationalIdValid(String NationalId) {
//     return NationalId = "";
//   }
//
//   String _isSocialIdValid(String SocialId) {
//     return SocialId = "";
//   }
//
//   String _isEmailValid(String Email) {
//     return Email = "";
//   }
//
//   String _isPhoneValid(String Phone) {
//     return Phone = "";
//   }
//
//   bool _isEmergencyValid(String emergencyNumber) {
//     return emergencyNumber != null;
//   }
//
//   bool _isAddressTextValid(String AddressText) {
//     return AddressText != null;
//   }
//
//   bool _isDistrictIdValid(int DistrictId) {
//     return DistrictId > 0;
//   }
//
//   bool _isPOBoxValid(String POBox) {
//     return POBox != null;
//   }
//
//   bool _isZipCodeValid(String ZipCode) {
//     return ZipCode != null;
//   }
//
//   @override
//   Sink get inputarabicName => ArabicNameStreamController.sink;
//
//   @override
//   Sink get inputenglishName => EnglishNameStreamController.sink;
//
//   @override
//   Sink get inputbirthDate => BirthDateStreamController.sink;
//
//   @override
//   Sink get inputnationalId => NationalIdStreamController.sink;
//
//   @override
//   Sink get inputsocialId => SocialIdStreamController.sink;
//
//   @override
//   Sink get inputemail => EmailStreamController.sink;
//
//   @override
//   Sink get inputphone => PhoneStreamController.sink;
//
//   @override
//   Sink get inputemergencyNumber => EmergencyStreamController.sink;
//
//   @override
//   Sink get inputaddressText => AddressTextStreamController.sink;
//
//   @override
//   Sink get inputdistrictId => DistrictIdStreamController.sink;
//
//   @override
//   Sink get inputpOBox => POBoxStreamController.sink;
//
//   @override
//   Sink get inputzipCode => ZipCodeStreamController.sink;
//
//
//
//
//   @override
//   // TODO: implement outputIsAddressTextValid
//   Stream<String?> get outputIsAddressTextValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsDistrictIdValid
//   Stream<int?> get outputIsDistrictIdValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsEmailValid
//   Stream<bool> get outputIsEmailValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsEmergencyValid
//   Stream<String?> get outputIsEmergencyValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsPhoneValid
//   Stream<String?> get outputIsPhoneValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsSocialIdValid
//   Stream<String?> get outputIsSocialIdValid => throw UnimplementedError();
//
//   @override
//   // TODO: implement outputIsZipCodeValid
//   Stream<String?> get outputIsZipCodeValid => throw UnimplementedError();
//
//
//
// ////////////////////////////////////////////////////////////////////
//
// }

class SaveBDViewModel extends BaseViewModel implements saveBDViewModelInputs, saveBDViewModelOutputs {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final saveEmpBasicDataUseCase _empBDUseCase;
  String userId;

  SaveBDViewModel(this._empBDUseCase, this.userId);

  // Stream Controllers
  final _arabicNameController = StreamController<String>.broadcast();
  final _englishNameController = StreamController<String>.broadcast();
  final _birthDateController = StreamController<String>.broadcast();
  final _nationalIdController = StreamController<String>.broadcast();
  final _socialIdController = StreamController<String>.broadcast();
  final _emailController = StreamController<String>.broadcast();
  final _phoneController = StreamController<String>.broadcast();
  final _emergencyController = StreamController<String>.broadcast();
  final _addressTextController = StreamController<String>.broadcast();
  final _districtIdController = StreamController<int>.broadcast();
  final _poBoxController = StreamController<String>.broadcast();
  final _zipCodeController = StreamController<String>.broadcast();
  final _allInputsValidController = StreamController<void>.broadcast();

  // Data Models
  var employeeObject = EmployeeSaveModel(0, "", "", "", "", "", "", "", "");
  var addressObject = AddressSaveModel("", 0, "", "");

  @override
  void start() => inputState.add(ContentState());

  @override
  void dispose() {
    _arabicNameController.close();
    _englishNameController.close();
    _birthDateController.close();
    _nationalIdController.close();
    _socialIdController.close();
    _emailController.close();
    _phoneController.close();
    _emergencyController.close();
    _addressTextController.close();
    _districtIdController.close();
    _poBoxController.close();
    _zipCodeController.close();
    _allInputsValidController.close();
    super.dispose();
  }

  @override
  // Future<void> saveBasicData(
  //     int empId,
  //     String arabicName,
  //     String englishName,
  //     String birthDate,
  //     String nationalId,
  //     String socialId,
  //     String email,
  //     String phone,
  //     String emergencyNumber,
  //     String addressText,
  //     int districtId,
  //     String poBox,
  //     String zipCode,
  //     ) async
  // {
  //   userId = await _appPreferences.getUserToken();
  //
  //   employeeObject = EmployeeSaveModel(
  //       empId, arabicName, englishName, birthDate, nationalId, socialId, email, phone, emergencyNumber
  //   );
  //
  //   addressObject = AddressSaveModel(addressText, districtId, poBox, zipCode);
  //
  //   inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
  //
  //   final result = await _empBDUseCase.execute(
  //     saveEmpBasicDataUseCaseInput(userId, employeeObject, addressObject),
  //   );
  //
  //   result.fold(
  //         (failure) => inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)),
  //         (data) {
  //       print("Saved Arabic Name: ${data.employee?.arabicName}");
  //       inputState.add(SuccessState("Employee data saved successfully"));
  //     },
  //   );
  // }

  Future<bool> saveBasicData() async {
    userId = await _appPreferences.getUserToken();

    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    final result = await _empBDUseCase.execute(
      saveEmpBasicDataUseCaseInput(userId, employeeObject, addressObject),
    );

    result.fold(
          (failure) {
            inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
            return false;
          },
          (data) {
        print("Saved Arabic Name: ${data.employee?.arabicName}");
        inputState.add(SuccessState("Employee data saved successfully"));

      },
    );
    return true;
  }
  // Inputs
  @override
  void setArabicName(String value) {
    _arabicNameController.sink.add(value);
    employeeObject.arabicName = value;
  }

  @override
  void setEnglishName(String value) {
    _englishNameController.sink.add(value);
    employeeObject.englishName = value;
  }

  @override
  void setBirthDate(String value) {
    _birthDateController.sink.add(value);
    employeeObject.birthdate = value;
  }

  @override
  void setNationalId(String value) {
    _nationalIdController.sink.add(value);
    employeeObject.nationalId = value;
  }

  @override
  void setSocialId(String value) {
    _socialIdController.sink.add(value);
    employeeObject.socialId = value;
  }

  @override
  void setEmail(String value) {
    _emailController.sink.add(value);
    employeeObject.email = value;
  }

  @override
  void setPhone(String value) {
    _phoneController.sink.add(value);
    employeeObject.phone = value;
  }

  @override
  void setEmergencyNumber(String value) {
    _emergencyController.sink.add(value);
    employeeObject.emergency_Number = value;
  }

  @override
  void setAddressText(String value) {
    _addressTextController.sink.add(value);
    addressObject.addressText = value;
  }

  @override
  void setDistrictId(int value) {
    _districtIdController.sink.add(value);
    addressObject.districtId = value;
  }

  @override
  void setPOBox(String value) {
    _poBoxController.sink.add(value);
    addressObject.pOBox = value;
  }

  @override
  void setZipCode(String value) {
    _zipCodeController.sink.add(value);
    addressObject.zipCode = value;
  }

  // Outputs
  @override
  Stream<String> get outputIsArabicNameValid =>
      _arabicNameController.stream.map(_validateRequiredField);

  @override
  Stream<String> get outputIsEnglishNameValid =>
      _englishNameController.stream.map(_validateRequiredField);

  @override
  Stream<String> get outputIsBirthDateValid =>
      _birthDateController.stream.map(_validateRequiredField);

  @override
  Stream<String> get outputIsNationalIdValid =>
      _nationalIdController.stream.map(_validateRequiredField);

  @override
  Stream<String> get outputIsSocialIdValid =>
      _socialIdController.stream.map(_validateRequiredField);

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailController.stream.map((val) => val.isNotEmpty);

  @override
  Stream<String> get outputIsPhoneValid =>
      _phoneController.stream.map(_validatePhone);

  @override
  Stream<bool> get outputIsEmergencyNumberValid =>
      _emergencyController.stream.map((val) => val.isNotEmpty);

  @override
  Stream<String> get outputIsAddressTextValid =>
      _addressTextController.stream.map(_validateRequiredField);


  @override
  Stream<bool> get outputIsDistrictIdValid =>
      _districtIdController.stream.map((val) => val != 0);



  @override
  Stream<bool> get outputIsPOBoxValid =>
      _poBoxController.stream.map((val) => val.isNotEmpty);

  @override
  Stream<String> get outputIsZipCodeValid =>
      _zipCodeController.stream.map(_validateRequiredField);

  // Validation helpers
  String _validateRequiredField(String value) =>
      value.isEmpty ? "Field is required" : "";

  String _validateEmail(String value) =>
      RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}\$').hasMatch(value)
          ? ""
          : "Invalid email";

  String _validatePhone(String value) =>
      RegExp(r'^[0-9]{9,15}\$').hasMatch(value) ? "" : "Invalid phone";

  // Sinks
  @override
  Sink get inputArabicName => _arabicNameController.sink;

  @override
  Sink get inputEnglishName => _englishNameController.sink;

  @override
  Sink get inputBirthDate => _birthDateController.sink;

  @override
  Sink get inputNationalId => _nationalIdController.sink;

  @override
  Sink get inputSocialId => _socialIdController.sink;

  @override
  Sink get inputEmail => _emailController.sink;

  @override
  Sink get inputPhone => _phoneController.sink;

  @override
  Sink get inputEmergencyNumber => _emergencyController.sink;

  @override
  Sink get inputAddressText => _addressTextController.sink;

  @override
  Sink get inputDistrictId => _districtIdController.sink;

  @override
  Sink get inputPOBox => _poBoxController.sink;

  @override
  Sink get inputZipCode => _zipCodeController.sink;



  @override
  // TODO: implement inputarabicName
  Sink get inputarabicName => throw UnimplementedError();

  @override
  // TODO: implement inputbirthDate
  Sink get inputbirthDate => throw UnimplementedError();

  @override
  // TODO: implement inputemail
  Sink get inputemail => throw UnimplementedError();

  @override
  // TODO: implement inputemergencyNumber
  Sink get inputemergencyNumber => throw UnimplementedError();

  @override
  // TODO: implement inputenglishName
  Sink get inputenglishName => throw UnimplementedError();

  @override
  // TODO: implement inputnationalId
  Sink get inputnationalId => throw UnimplementedError();

  @override
  // TODO: implement inputphone
  Sink get inputphone => throw UnimplementedError();

  @override
  // TODO: implement inputsocialId
  Sink get inputsocialId => throw UnimplementedError();

  @override
  // TODO: implement outputIsEmergencyValid
  Stream<String?> get outputIsEmergencyValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsEmpCodeValid
  Stream<String?> get outputIsEmpCodeValid => throw UnimplementedError();

  @override
  void setEmpCode(String code) {
    // TODO: implement setEmpCode
  }
}

abstract class saveBDViewModelInputs {
  void setArabicName(String name);
  void setEnglishName(String name);
  void setEmail(String email);
  void setPhone(String phone);
  void setNationalId(String id);
  void setEmpCode(String code);

  Future<bool> saveBasicData();
}

abstract class saveBDViewModelOutputs {
  Stream<String?> get outputIsArabicNameValid;
  Stream<String?> get outputIsEnglishNameValid;
  Stream<bool?> get outputIsEmailValid;
  Stream<String?> get outputIsPhoneValid;
  Stream<String?> get outputIsNationalIdValid;
  Stream<String?> get outputIsEmpCodeValid;
}
