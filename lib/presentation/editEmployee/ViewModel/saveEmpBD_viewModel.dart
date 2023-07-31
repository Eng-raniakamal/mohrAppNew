//
// import 'dart:async';
// import 'package:mohr_hr/data/networks/dio_factory.dart';
// import 'package:mohr_hr/domain/usecase/saveEmpBD_useCase.dart';
// import '../../Base/baseviewmodel.dart';
// import '../../common/state_renderer/state_render_impl.dart';
// import '../../common/freezed_data_classes.dart';
// import '../../common/state_renderer/state_renderer.dart';
//
// class saveBDViewModel extends BaseViewModel
//     with   saveBDViewModelInputs,saveBDViewModelOutputs {
//
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
//   final saveEmpBasicDataUseCase _EmpBDUseCase;
//
//   var EmployeeDBObject = empBasicDataObject(
//     UserId,
//     empId,
//     "",
//     "",
//     //"",
//     // "",
//     // "",
//     // "",
//     // "",
//     // "",
//     // "",
//     // 0,
//     // "",
//     // ""
//   );
//
//   saveBDViewModel(this._EmpBDUseCase);
//
//
// //--input
//   @override
//   void start() {
//     inputState.add(ContentState());
//   }
//
//   // @override
//   // SaveBasicData()
//
//   //async
// // {
// //   EmployeeDBObject.userID;
// //   EmployeeDBObject.empId;
// //
// //   inputState.add(
// //       LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
// //   (await _EmpBDUseCase.execute(
// //       saveEmpBasicDataUseCaseInput(
// //           EmployeeDBObject.userID,
// //           EmployeeDBObject.empId,
// //
// //           EmployeeDBObject.ArabicName,
// //           // EmployeeDBObject.ArabicName,
// //           // EmployeeDBObject.EnglishName,
// //           // EmployeeDBObject.BirthDate,
// //           // EmployeeDBObject.NationalId,
// //           // EmployeeDBObject.SocialId,
// //           // EmployeeDBObject.Email,
// //           // EmployeeDBObject.Phone,
// //           // EmployeeDBObject.Emergency_Number,
// //           // EmployeeDBObject.AddressText,
// //           // EmployeeDBObject.DistrictId,
// //           // EmployeeDBObject.PoBox,
// //           // EmployeeDBObject.ZipCode
// //       )
// //   ))
// //       .fold((failure) =>
// //   {inputState.add(
// //       ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message)),
// //
// //   }, (data) {
// //     inputState.add(ContentState());
// //   });
// // }
//
//   @override
//   Sink get inputArabicName => ArabicNameStreamController.sink;
//
//   @override
//   Sink get inputEnglishName => EnglishNameStreamController.sink;
//
//   @override
//   Sink get inputBirthDate => BirthDateStreamController.sink;
//
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
//   @override
//   // Stream<String> get outputIsAddressTextValid =>
//   //     outputIsAddressTextValid.map((isAddressTextValid)=> isAddressValid ? null :"Invalide" ;
//   //
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
//   @override
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
//     inputAddressText.add(addressText);
//     if (_isAddressTextValid(addressText)) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(AddressText: addressText);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(AddressText: addressText);
//     }
//   }
//
//   @override
//   setArabicName(String arabicName) {
//     inputArabicName.add(arabicName);
//     if (_isArabicNameValid(arabicName) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(ArabicName: arabicName);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(ArabicName: arabicName);
//     }
//   }
//
//   @override
//   setEnglishName(String englishName) {
//     inputEnglishName.add(englishName);
//     if (_isEnglishNameValid(englishName) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(EnglishName: englishName);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(EnglishName: englishName);
//     }
//   }
//
//   @override
//   setBirthDate(String birthDate) {
//     inputBirthDate.add(birthDate);
//     if (_isBirthDateValid(birthDate) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(BirthDate: birthDate);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(BirthDate: birthDate);
//     }
//   }
//
//   @override
//   setNationalId(String nationalId) {
//     inputNationalId.add(nationalId);
//     if (_isNationalIdValid(nationalId) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(NationalId: nationalId);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(NationalId: nationalId);
//     }
//   }
//
//   @override
//   setSocialId(String socialId) {
//     inputSocialId.add(socialId);
//     if (_isSocialIdValid(socialId) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(SocialId: socialId);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(SocialId: socialId);
//     }
//   }
//
//   @override
//   setDistrictId(int districtId) {
//     inputDistrictId.add(districtId);
//     if (_isDistrictIdValid(districtId)) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(DistrictId: districtId);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(DistrictId: districtId);
//     }
//   }
//
//   @override
//   setEmail(String email) {
//     inputEmail.add(email);
//     if (_isEmailValid(email) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(Email: email);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(Email: email);
//     }
//   }
//
//   @override
//   setEmergencyNumber(String emergencyNumber) {
//     inputEmergencyNumber.add(emergencyNumber);
//     if (_isEmergencyValid(emergencyNumber)) {
//       EmployeeDBObject =
//           EmployeeDBObject.copyWith(Emergency_Number: emergencyNumber);
//     }
//     else {
//       EmployeeDBObject =
//           EmployeeDBObject.copyWith(Emergency_Number: emergencyNumber);
//     }
//   }
//
//   @override
//   setPOBox(String pOBox) {
//     inputPOBox.add(pOBox);
//     if (_isPOBoxValid(pOBox)) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(PoBox: pOBox);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(PoBox: pOBox);
//     }
//   }
//
//   @override
//   setPhone(String phone) {
//     inputPhone.add(phone);
//     if (_isPhoneValid(phone) != null) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(Phone: phone);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(Phone: phone);
//     }
//   }
//
//   @override
//   setZipCode(String zipCode) {
//     inputZipCode.add(zipCode);
//     if (_isZipCodeValid(zipCode)) {
//       EmployeeDBObject = EmployeeDBObject.copyWith(ZipCode: zipCode);
//     }
//     else {
//       EmployeeDBObject = EmployeeDBObject.copyWith(ZipCode: zipCode);
//     }
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
//     return Email = " ";
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
//
//
//
//
//
//
//   @override
//   Sink get arabicName => ArabicNameStreamController.sink;
//
//   @override
//   Sink get englishName => EnglishNameStreamController.sink;
//
//   @override
//   Sink get birthDate => BirthDateStreamController.sink;
//
//   @override
//   Sink get nationalId => NationalIdStreamController.sink;
//
//   @override
//   Sink get socialId => SocialIdStreamController.sink;
//
//   @override
//   Sink get email => EmailStreamController.sink;
//
//   @override
//   Sink get phone => PhoneStreamController.sink;
//
//   @override
//   Sink get emergencyNumber => EmergencyStreamController.sink;
//
//   @override
//   Sink get addressText => AddressTextStreamController.sink;
//
//   @override
//   Sink get districtId => DistrictIdStreamController.sink;
//
//   @override
//   Sink get pOBox => POBoxStreamController.sink;
//
//   @override
//   Sink get zipCode => ZipCodeStreamController.sink;
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
// abstract class saveBDViewModelOutputs
//   {
//   Stream<String?>get outputIsArabicNameValid;
//   Stream<String?>get outputIsEnglishNameValid;
//   Stream<String?>get outputIsBirthDateValid;
//   Stream<String?>get outputIsNationalIdValid;
//   Stream<String?>get outputIsSocialIdValid;
//   Stream<bool>get outputIsEmailValid;
//   Stream<String?>get outputIsPhoneValid;
//   Stream<String?>get outputIsEmergencyValid;
//   Stream<String?>get outputIsAddressTextValid;
//   Stream<int?>get outputIsDistrictIdValid;
//   Stream<String?>get outputIsZipCodeValid;
//
//   }
//
// abstract class saveBDViewModelInputs{
//
//   SaveBasicData();
//   //employee
//   setArabicName(String arabicName);
//   setEnglishName(String englishName);
//   setBirthDate(String birthDate);
//   setNationalId(String nationalId);
//   setSocialId(String socialId);
//   setEmail(String email);
//   setPhone(String phone);
//   setEmergencyNumber(String emergencyNumber);
//
//   //Address
//
//   setAddressText(String addressText);
//   setDistrictId(int districtId);
//   setPOBox(String poBox);
//   setZipCode(String zipCode);
//   Sink get arabicName;
//   Sink get englishName;
//   Sink get birthDate;
//   Sink get nationalId;
//   Sink get socialId;
//   Sink get email;
//   Sink get phone;
//   Sink get emergencyNumber;
//
//
//   }
//
