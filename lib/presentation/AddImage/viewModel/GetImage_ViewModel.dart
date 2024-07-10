

import 'dart:async';

import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/employee_UseCase.dart';
import 'package:essmohr/domain/usecase/userImage_usecase.dart';

import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import 'package:essmohr/presentation/common/freezed_data_classes.dart';



class EmployeeImageViewModel extends BaseViewModel implements
    EmployeeImageViewModelInputs,EmployeeImageViewModelOutputs {

  StreamController _UserIdStreamController= StreamController<String>.broadcast();


  final _EmployeeImageStreamController = BehaviorSubject<UserImageModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final UserImageUseCase _EmployeeUseCase;
  EmployeeImageViewModel(this._EmployeeUseCase);
  String? uId;
  var userObject;
  //userObject;


  //---Inputs
  @override
  void start() {
    getUserImage();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    super.dispose();
  }

  @override
  getUserImage() async{
    uId=await _appPreferences.getUserToken();
    var userObject=UserObject(uId!);
    userObject.userID;
    if(userObject.userID!=null)
    {
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _EmployeeUseCase.execute
        (UserImageUseCaseInput(userObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmployeeImage.add(UserImageModel(userObject.userID!,data.data.toString()));
          }
      );}
    else
    {
      userObject.userID;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _EmployeeUseCase.execute
        (UserImageUseCaseInput(userObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmployeeImage.add(data.data);
          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;


  @override
  Sink get EmployeeImage => _EmployeeImageStreamController.sink;


  @override
  Stream <UserImageModel> get outputUserImage =>
      _EmployeeImageStreamController.stream.map((data) =>data );
}

abstract class EmployeeImageViewModelInputs{

  Sink get EmployeeImage;
}
abstract class EmployeeImageViewModelOutputs{
  Stream<UserImageModel> get outputUserImage;
}