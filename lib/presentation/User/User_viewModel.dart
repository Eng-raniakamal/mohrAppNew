

import 'dart:async';

import 'package:essmohr/application/constants.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/employee_UseCase.dart';

import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import 'package:essmohr/presentation/common/freezed_data_classes.dart';

import '../../application/app_prefs.dart';
import '../../application/di.dart';

class EmployeeViewModel extends BaseViewModel implements
    EmployeeViewModelInputs,EmployeeViewModelOutputs {

  StreamController _UserIdStreamController= StreamController<String>.broadcast();

  final _EmployeeDataStreamController = BehaviorSubject<EmployeeDataModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final EmployeeUseCase _EmployeeUseCase;
  EmployeeViewModel(this._EmployeeUseCase);
  String? uId;
  var userObject;
  //userObject;


  //---Inputs
  @override
  void start() {
   getuserData();
  }

  bool _isDisposed =false;
  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _isDisposed =true;
    super.dispose();
  }


  getuserData() async{
      uId=await _appPreferences.getUserToken();
      var userObject=UserObject(uId!);
      userObject.userID;
    if(_isDisposed)
    {
      return;
    }
    else
      {
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _EmployeeUseCase.execute
        (EmployeeUseCaseInput(userObject.userID))).fold(
    (failure) =>{ inputState.add
    (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
    },
              (data){
      if(_isDisposed)
        {return;}
    inputState.add(ContentState());
    EmployeeData.add(EmployeeDataModel(data.userDataModel));
    }
      );}
    // else
    //   {
    //     userObject.userID;
    //       inputState.add(
    //           LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
    //       );
    //       (await _EmployeeUseCase.execute
    //         (EmployeeUseCaseInput(userObject.userID))).fold(
    //               (failure) =>{ inputState.add
    //             (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
    //           },
    //               (data){
    //             inputState.add(ContentState());
    //             EmployeeData.add(EmployeeDataModel(
    //                 data.userDataModel));
    //           }
    //       );
    //
    //   }
  }


  Sink get inputUserId => _UserIdStreamController.sink;


  @override
  Sink get EmployeeData => _EmployeeDataStreamController.sink;


  @override
  Stream <EmployeeDataModel> get outputUserData =>
      _EmployeeDataStreamController.stream.map((data) =>data );
}

abstract class EmployeeViewModelInputs{

  Sink get EmployeeData;
}
abstract class EmployeeViewModelOutputs{
  Stream<EmployeeDataModel> get outputUserData;
}