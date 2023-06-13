import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/functions.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/login_usecase.dart';
import 'package:mohr_hr/presentation/base/baseviewmodel.dart';
import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {

  //broadcast let the stream controller has more listener
  final StreamController _emailStreamController =
  StreamController<String>.broadcast();


  final StreamController _passwordStreamController =
  StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
  StreamController<bool>();



//data class carry email, password and device Id

  var loginObject = LoginObject("","","");
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // view tells state renderer, please show the content of the screen
    inputState.add(ContentState());
  }


  @override
  Sink get inputemail => _emailStreamController.sink;



  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    DeviceInfo deviceDetails = await getDeviceDetails();
    String device_id=deviceDetails.identifier;
    loginObject.deviceId;
    inputState.add(
        LoadingState(stateRendererType:
        StateRendererType.POPUP_LOADING_STATE));
    (await _loginUseCase.execute(
        LoginUseCaseInput(loginObject.email, loginObject.password,device_id)))
        .fold(
            (failure) =>
        {
          print(failure.message),
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.POPUP_ERROR_STATE, failure.message))
        },
            (data) {
          // right -> success (data)

          inputState.add(ContentState());
          // navigate to profile(HOME)  screen after the login
          isUserLoggedInSuccessfullyStreamController.add(true);
        });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class operation same as kotlin
    _validate();
  }

  @override
  setemail(String email) {
    inputemail.add(email);
    loginObject = loginObject.copyWith(
        email: email); // data class operation same as kotlin
    _validate();
  }



  // outputs
  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream
          .map((password) => _isPasswordValid(password));

  // Stream<String> get outputIsPasswordValid =>
  //     _passwordStreamController.stream
  //         .map((password) => _isPasswordValid(password));
  // String _isPasswordValid2(String password)
  // {
  //   if (password.isNotEmpty)
  //     {
  //       return"";
  //     }
  //   else{
  //     return"please enter your password";
  //   }
  // }



  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream
          .map((email) => _isemailValid(email));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  // private functions

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isemailValid(String email) {
    return email.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isemailValid(loginObject.email);
  }
}

abstract class LoginViewModelInputs {
  // three functions for actions
  // EMAIL,PASSWORD,CLICK ON BUTTON

  setemail(String email);
  setPassword(String password);
  login();


// two sinks for streams
  Sink get inputemail;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {

  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
