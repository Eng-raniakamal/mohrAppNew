import 'dart:async';

//import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/data/networks/dio_factory.dart';
import '../../../domain/usecase/empSkills_UseCase.dart';
import '../../common/freezed_data_classes.dart';
import '../../common/state_renderer/state_renderer.dart';

class EmployeeSkillsViewModel extends BaseViewModel with
    EmployeeSkillsViewModelInput,EmployeeSkillsViewModelOutput
{
  StreamController DateStreamController=StreamController<String>.broadcast();
  StreamController GradeIdStreamController=StreamController<int>.broadcast();
  StreamController QualificationIdStreamController=StreamController<int>.broadcast();
  StreamController EmployeeIdStreamController=StreamController<int>.broadcast();


  final EmployeeSkillsUseCase _employeeSkillsUseCase;
  //String userId;
  var EmployeeSkillsObject=empSkillsObject(UserId,"",0,0,0);

  EmployeeSkillsViewModel(this._employeeSkillsUseCase);


//--input

  @override
  Sink get inputDate => DateStreamController.sink;
  @override
  Sink get inputEmployeeId => EmployeeIdStreamController.sink;
  @override
  Sink get inputGradeId => GradeIdStreamController.sink;
  @override
  Sink get inputQualificationId => QualificationIdStreamController.sink;

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose()
  {
    DateStreamController.close();
    GradeIdStreamController.close();
    QualificationIdStreamController.close();
    EmployeeIdStreamController.close();
    super.dispose();
  }
  //--Output

  @override
  Stream<bool> get outputEmployeeIdValid =>
      EmployeeIdStreamController.stream.map(
              (empId) => _isEmployeeIdValid(empId));

  @override

  Stream<bool> get outputGradeIdValid => GradeIdStreamController.stream
      .map((gradId) => _isGradeIdValid(gradId));

  @override
  Stream<bool> get outputQualificationIdValid => QualificationIdStreamController.stream
      .map((qualificationId) => _isQualificationIdValid(qualificationId));

  @override
  Stream<bool> get outputDateValid => DateStreamController.stream.
  map((date) => _isDateValid(date));

  @override
  Stream<String?> get outputErrorDate => outputDateValid
      .map((isEmailValid) => isEmailValid ? null : "Invalid Date");

  //--Private functions
  bool _isEmployeeIdValid(int empId){
    return empId>0 ;
  }
  bool _isGradeIdValid(int gradeId){
    return gradeId>0 ;
  }
  bool _isQualificationIdValid(int qualificationId){
    return qualificationId>0 ;
  }
  bool _isDateValid(String date){
    return date!=null ;
  }

  @override
  setDate(String date) {
    if(_isDateValid(date))
    {EmployeeSkillsObject=EmployeeSkillsObject.copyWith(Date: date);   }
    else{
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(Date: date);
    }
  }

  @override
  setEmployeeId(int employeeId) {
    if(_isEmployeeIdValid(employeeId)){
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(EmployeeId: employeeId);
    }
    else{
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(EmployeeId: employeeId);
    }
  }

  @override
  setGradeId(int gradeId) {
    if(_isGradeIdValid(gradeId)){
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(GradeId: gradeId);
    }
    else{ EmployeeSkillsObject=EmployeeSkillsObject.copyWith(GradeId: gradeId);}
  }

  @override
  setQualificationId(int qualificationId) {
    if(_isQualificationIdValid(qualificationId)){
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(QualificationId: qualificationId);
    }
    else{
      EmployeeSkillsObject=EmployeeSkillsObject.copyWith(QualificationId: qualificationId );
    }
  }

  @override
  addSkills() async{

    EmployeeSkillsObject.userID;

    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _employeeSkillsUseCase.execute(
        EmployeeSkillsUseCaseInput(
            EmployeeSkillsObject.userID,
            EmployeeSkillsObject.Date,
            EmployeeSkillsObject.GradeId,
            EmployeeSkillsObject.QualificationId,
            EmployeeSkillsObject.EmployeeId)
    ))
        .fold((failure) => {inputState.add(
        ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message)),

    },(data)
    {
      inputState.add(ContentState());
    });

  }

}

abstract class EmployeeSkillsViewModelInput{
  Sink get inputDate;
  Sink get inputGradeId;
  Sink get inputQualificationId;
  Sink get inputEmployeeId;
  addSkills();
  setDate(String date);
  setGradeId(int gradeId);
  setQualificationId(int qualificationId);
  setEmployeeId(int employeeId);
}

abstract class EmployeeSkillsViewModelOutput{
  Stream<bool> get outputDateValid;
  Stream<bool> get outputGradeIdValid;
  Stream<bool> get outputQualificationIdValid;
  Stream<bool> get outputEmployeeIdValid;
}