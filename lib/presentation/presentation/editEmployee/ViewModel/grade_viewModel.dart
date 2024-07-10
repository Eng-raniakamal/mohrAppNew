

import 'dart:async';

import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/employee_UseCase.dart';
import 'package:mohr_hr/domain/usecase/grade_useCase.dart';
//import 'package:mohr_hr/domain/usecase/qualification_useCase.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';
import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';


class GradeViewModel extends BaseViewModel with
    GradeViewModelInputs, GradeViewModelOutputs {

  StreamController _UserIdStreamController = StreamController<
      String>.broadcast();

  final GradeStreamController = BehaviorSubject<GradesObject>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final GradeUseCase _GradesUseCase;

  GradeViewModel(this._GradesUseCase);

  String? uId ;
  var gradeObject;

  //userObject;


  //---Inputs
  @override
  void start() {
    getgradeData() ;
  }

  @override
  void dispose() {
    _UserIdStreamController.close();
    super.dispose();
  }

  @override
  getgradeData() async {
    uId = await _appPreferences.getUserToken();
    //"0a6e6bc6-00a5-4dcc-bb69-16e6309613c4";
    //
    var GradeObject = UserObject(uId!);
    GradeObject.userID;
    if (GradeObject.userID != null) {
      inputState.add(
          LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE)
      );
      (await _GradesUseCase.execute
        (GradeUseCaseInput(GradeObject.userID))).fold(
              (failure) =>
          { inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
          },
              (data) {
            inputState.add(ContentState());
            GradeData.add(GradesObject(data.grades));
          }
      );
    }
    else {
      GradeObject.userID;
      inputState.add(
          LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE)
      );
      (await _GradesUseCase.execute
        (GradeUseCaseInput(GradeObject.userID))).fold(
              (failure) =>
          { inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
          },
              (data) {
            inputState.add(ContentState());
            GradeData.add(GradesObject(data.grades));
          }
      );
    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;


  @override
  Sink get GradeData => GradeStreamController.sink;


  @override
  Stream <GradesObject> get outputGrades =>
      GradeStreamController.stream.map((data) => data);

  @override
  // TODO: implement EmployeeData
  Sink get EmployeeData => throw UnimplementedError();

  @override

  Stream<GradesObject> get outputgradeData =>
      GradeStreamController.stream.map((data) => data);

}

abstract class GradeViewModelInputs{
  Sink get EmployeeData;
}
abstract class GradeViewModelOutputs{
  Stream<GradesObject> get outputgradeData;
}