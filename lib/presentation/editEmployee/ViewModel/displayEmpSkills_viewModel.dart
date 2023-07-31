

import 'dart:async';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/displaySkills_useCase.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';
import '../../../domain/usecase/empBD_useCase.dart';
import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';


class DisplayEmpSkillsViewModel extends BaseViewModel with
    DisplayEmpSkillsViewModelInputs,DisplayEmpSkillsViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();
  final StreamController _EmpIdStreamController= StreamController<int>.broadcast();

  //from rxdart
  final _SkillsStreamController = BehaviorSubject<getEmpSkillsModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final displaySkillsUseCase _SkillsUseCase;
  DisplayEmpSkillsViewModel ( this._SkillsUseCase);
  String? uId;
  int? empId;
  var empObject;
  //empObject("",0);

  //---Inputs
  @override
  void start() {
    getEmpSkills();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _EmpIdStreamController.close();
    super.dispose();
  }

  @override
  getEmpSkills()
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
      (await _SkillsUseCase.execute
        (displaySkillsInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{
            inputState.add(ErrorState(
                StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpSkill.add(getEmpSkillsModel(data.skills,data.allowEdit));
          });
    }
    else
    {
      empObject.userID;
      empObject.empId;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _SkillsUseCase.execute

        (displaySkillsInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpSkill.add(getEmpSkillsModel(data.skills,data.allowEdit));

          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get inputEmpId => _EmpIdStreamController.sink;

  @override
  Sink get EmpSkill => _SkillsStreamController.sink;

  @override
  Stream<getEmpSkillsModel> get outputEmpSkill => _SkillsStreamController.stream.
  map((data) => data);
}

abstract class DisplayEmpSkillsViewModelInputs{
  Sink get inputUserId;
  Sink get inputEmpId;
}

abstract class DisplayEmpSkillsViewModelOutputs{
  Stream<getEmpSkillsModel> get outputEmpSkill;
}
class  EmpSkillsViewObject {
  getEmpSkillsModel employeeSkills;
  EmpSkillsViewObject(this.employeeSkills);
}



