

import 'dart:async';

import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/Degree_useCase.dart';
import 'package:mohr_hr/domain/usecase/employee_UseCase.dart';
import 'package:mohr_hr/domain/usecase/Degree_useCase.dart';
//import 'package:mohr_hr/domain/usecase/qualification_useCase.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';
import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';


class DegreeViewModel extends BaseViewModel with
    DegreeViewModelInputs, DegreeViewModelOutputs {

  StreamController _UserIdStreamController = StreamController<
      String>.broadcast();

  final DegreeStreamController = BehaviorSubject<DegreeObject>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final DegreeUseCase _DegreeUseCase;

  DegreeViewModel(this._DegreeUseCase);

  String? uId ;
  var AcademicDegreeObject;

  //userObject;


  //---Inputs
  @override
  void start() {
    getDegreeData() ;
  }

  @override
  void dispose() {
    _UserIdStreamController.close();
    super.dispose();
  }

  @override
  getDegreeData() async {
    uId = await _appPreferences.getUserToken();
    //"0a6e6bc6-00a5-4dcc-bb69-16e6309613c4";
    //
    var degreeObject = UserObject(uId!);
    degreeObject.userID;
    if (degreeObject.userID != null) {
      inputState.add(
          LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE)
      );
      (await _DegreeUseCase.execute
        (DegreeUseCaseInput(degreeObject.userID))).fold(
              (failure) =>
          { inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
          },
              (data) {
            inputState.add(ContentState());
            DegreeData.add(DegreeObject(data.Degrees));
          }
      );
    }
    else {
      degreeObject.userID;
      inputState.add(
          LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE)
      );
      (await _DegreeUseCase.execute
        (DegreeUseCaseInput(degreeObject.userID))).fold(
              (failure) =>
          { inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
          },
              (data) {
            inputState.add(ContentState());
            DegreeData.add(DegreeObject(data.Degrees));
          }
      );
    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;


  @override
  Sink get DegreeData => DegreeStreamController.sink;


  @override
  Stream <DegreeObject> get outputDegrees =>
      DegreeStreamController.stream.map((data) => data);

  @override
  // TODO: implement EmployeeData
  Sink get EmployeeData => throw UnimplementedError();

  @override

  Stream<DegreeObject> get outputDegreeData =>
      DegreeStreamController.stream.map((data) => data);

}

abstract class DegreeViewModelInputs{
  Sink get EmployeeData;
}
abstract class DegreeViewModelOutputs{
  Stream<DegreeObject> get outputDegreeData;
}