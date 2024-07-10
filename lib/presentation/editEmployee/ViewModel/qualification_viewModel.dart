

import 'dart:async';

import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/employee_UseCase.dart';
import 'package:essmohr/domain/usecase/qualification_useCase.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import 'package:essmohr/presentation/common/freezed_data_classes.dart';


class QualificationViewModel extends BaseViewModel implements
    QualificationViewModelInputs, QualificationViewModelOutputs {

  StreamController _UserIdStreamController= StreamController<String>.broadcast();

  final QualificationStreamController = BehaviorSubject<QualificationsObject>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final QualificationUseCase _QualificationsUseCase;
  QualificationViewModel(this._QualificationsUseCase);
  String? uId;
  var userObject;
  //userObject;


  //---Inputs
  @override
  void start() {
    getuserData();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    super.dispose();
  }

  @override
  getuserData()
  async{
    uId=await _appPreferences.getUserToken();
    var userObject=UserObject(uId!);
    userObject.userID;
    if(userObject.userID!=null)
    {
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _QualificationsUseCase.execute
        (QualificationUseCaseInput(userObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            QualificationData.add(QualificationsObject(data.qualifications));
          }
      );}
    else
    {
      userObject.userID;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _QualificationsUseCase.execute
        (QualificationUseCaseInput(userObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            QualificationData.add(QualificationsObject(data.qualifications));
          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;


  @override
  Sink get QualificationData => QualificationStreamController.sink;


  @override
  Stream <QualificationsObject> get outputQualifications =>
      QualificationStreamController.stream.map((data) =>data );

  @override
  // TODO: implement EmployeeData
  Sink get EmployeeData => throw UnimplementedError();

  @override
  // TODO: implement outputUserData
  Stream<QualificationsObject> get outputUserData => throw UnimplementedError();
}

abstract class QualificationViewModelInputs{

  Sink get EmployeeData;
}
abstract class QualificationViewModelOutputs{
  Stream<QualificationsObject> get outputUserData;
}