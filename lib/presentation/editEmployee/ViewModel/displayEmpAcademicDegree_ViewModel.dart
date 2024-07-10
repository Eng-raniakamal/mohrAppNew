

import 'dart:async';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/displaySkills_useCase.dart';
import 'package:essmohr/domain/usecase/empAcademicDegree_useCase.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import '../../../domain/usecase/empBD_useCase.dart';
import 'package:essmohr/presentation/common/freezed_data_classes.dart';


class DisplayAcademicDegreeViewModel extends BaseViewModel implements
    DisplayAcademicDegreeViewModelInputs,DisplayAcademicDegreeViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();
  final StreamController _EmpIdStreamController= StreamController<int>.broadcast();

  //from rxdart
  final _AcademicDegreeStreamController = BehaviorSubject<getAcademicDegreeModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final GetAcademicDegreeUseCase _AcademicDegreeUseCase;
  DisplayAcademicDegreeViewModel ( this._AcademicDegreeUseCase);
  String? uId;
  int? empId;
  var empObject;
  //empObject("",0);

  //---Inputs
  @override
  void start() {
    getEmpAcademicDegree();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _EmpIdStreamController.close();
    super.dispose();
  }

  @override
  getEmpAcademicDegree()
  async{
    uId=await _appPreferences.getUserToken();
    empId=await _appPreferences.getEmpIdToken();
    var  empObject=EmpBasicDataObject(uId!,empId!);
    empObject.userID;
    empObject.empId;
    if(empObject.userID != null && empObject.empId !=0)
    {
      inputState.add(LoadingState(
          stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _AcademicDegreeUseCase.execute
        (getAcademicDegreeUseCaseInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{
            inputState.add(ErrorState(
                StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpAcademicDegree.add(getAcademicDegreeModel(data.academicDegree,data.allowEdit));
          });
    }
    else
    {
      empObject.userID;
      empObject.empId;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _AcademicDegreeUseCase.execute

        (getAcademicDegreeUseCaseInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpAcademicDegree.add(getAcademicDegreeModel(data.academicDegree,data.allowEdit));

          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get inputEmpId => _EmpIdStreamController.sink;

  @override
  Sink get EmpAcademicDegree => _AcademicDegreeStreamController.sink;


  @override

  Stream<getAcademicDegreeModel> get outputAcademicDegree => _AcademicDegreeStreamController.stream.
  map((data) => data);
}

abstract class DisplayAcademicDegreeViewModelInputs{
  Sink get inputUserId;
  Sink get inputEmpId;
}

abstract class DisplayAcademicDegreeViewModelOutputs{
  Stream<getAcademicDegreeModel> get outputAcademicDegree;
}
class  AcademicDegreeViewObject {
  getAcademicDegreeModel employeeAcademicDegree;
  AcademicDegreeViewObject(this.employeeAcademicDegree);
}



