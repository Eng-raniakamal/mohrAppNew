import 'dart:async';

//import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/domain/usecase/saveAcademicDegree_UseCase.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:essmohr/presentation/common/freezed_data_classes.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/data/networks/dio_factory.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';


class SaveAcademicDegreeViewModel extends BaseViewModel implements
    AcademicDegreeViewModelInput,AcademicDegreeViewModelOutput
{
  final AppPreferences _appPreferences = instance<AppPreferences>();
  StreamController IdStreamController=StreamController<int>.broadcast();
  StreamController MajorStreamController=StreamController<String>.broadcast();
  StreamController UniversityStreamController=StreamController<String>.broadcast();
  StreamController NotesStreamController=StreamController<String>.broadcast();
  StreamController EmployeeIdStreamController=StreamController<int>.broadcast();
  StreamController AcademicDegreeTypeIdStreamController=StreamController<int>.broadcast();
  StreamController GradeIdStreamController=StreamController<int>.broadcast();
  StreamController DegreeDateStreamController=StreamController<String>.broadcast();

  late final saveAcademicDegreeUseCase  _empAcademicDegreeUseCase;
  var EmpAcademicDegreeObject = empAcademicDegreeObject(UserId,0,"","","",0,0,0,"");

  SaveAcademicDegreeViewModel (this._empAcademicDegreeUseCase);

//--input

  @override
  Sink get inputId => IdStreamController.sink;
  @override
  Sink get inputMajor => MajorStreamController.sink;
  @override
  Sink get inputUniversity => UniversityStreamController.sink;
  @override
  Sink get inputNotes => NotesStreamController.sink;
  @override
  Sink get inputEmployeeId => EmployeeIdStreamController.sink;
  @override
  Sink get inputGradeId => GradeIdStreamController.sink;
  @override
  Sink get inputAcademicDegreeTypeId => AcademicDegreeTypeIdStreamController.sink;
  @override
  Sink get inputDegreeDate => DegreeDateStreamController.sink;




  @override
  void start() {
    inputState.add(ContentState());

  }

  @override
  void dispose()
  {
    IdStreamController.close();
    MajorStreamController.close();
    UniversityStreamController.close();
    NotesStreamController.close();
    GradeIdStreamController.close();
    EmployeeIdStreamController.close();
    AcademicDegreeTypeIdStreamController.close();
    DegreeDateStreamController.close();
    super.dispose();
  }
  //--Output



  @override

  Stream<bool> get outputGradeIdValid => GradeIdStreamController.stream
      .map((gradId) => _isGradeIdValid(gradId));

  @override
  Stream<bool> get outputAcademicDegreeTypeIdValid =>  AcademicDegreeTypeIdStreamController.stream
      .map((qualificationId) => _isAcademicDegreeTypeIdValid(qualificationId));

  @override
  Stream<bool> get outputDegreeDateValid => DegreeDateStreamController.stream.
  map((date) => _isDegreeDateValid(date));

  @override
  Stream<String?> get outputErrorDate => outputDateValid
      .map((isEmailValid) => isEmailValid ? null : "Invalid Date");

  //--Private functions
  // bool _isEmployeeIdValid(int empId){
  //   return empId>0 ;
  // }
  bool _isGradeIdValid(int gradeId){
    return gradeId>0 ;
  }
  bool _isAcademicDegreeTypeIdValid(int qualificationId){
    return qualificationId>0 ;
  }
  bool _isDegreeDateValid(String date){
    return date!=null ;
  }

  @override
  setDate(String date) {
    if(_isDegreeDateValid(date))
    {EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(DegreeDate: date);   }
    else{
      EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(DegreeDate: date);
    }
  }

  @override
  setEmployeeId(int employeeId) {

      EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(EmployeeId: employeeId);

  }

  @override
  setGradeId(int gradeId) {
    if(_isGradeIdValid(gradeId)){
      EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(GradeId: gradeId);
    }
    else{ EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(GradeId: gradeId);}
  }

  @override
  setAcademicDegreeTypeId(int academicDegreeTypeId) {
    if(_isAcademicDegreeTypeIdValid(academicDegreeTypeId)){
      EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(AcademicDegreeTypeId: academicDegreeTypeId);
    }
    else{
      EmpAcademicDegreeObject=EmpAcademicDegreeObject.copyWith(AcademicDegreeTypeId: academicDegreeTypeId);
    }
  }

  @override
  addAcdemicDegree()  async{
    String userId=await _appPreferences.getUserToken();
    int empId=await _appPreferences.getEmpIdToken();
    EmpAcademicDegreeObject.userID;
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _empAcademicDegreeUseCase.execute (
        SaveAcademicDegreeUseCaseInput(
            userId,
        EmpAcademicDegreeObject.Id,
        EmpAcademicDegreeObject.Major,
        EmpAcademicDegreeObject.University,
        EmpAcademicDegreeObject.Notes,
          empId,
        EmpAcademicDegreeObject.AcademicDegreeTypeId,
          EmpAcademicDegreeObject.GradeId,
          EmpAcademicDegreeObject.DegreeDate,)
    ))
        .fold((failure) => {inputState.add(
        ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message)),

    },(data)
    {
      inputState.add(ContentState());
    });

  }



  @override
  Sink get inputAcdemicDegreeTypeId => throw UnimplementedError();

  @override
  Stream<bool> get outputDateValid => throw UnimplementedError();

  @override
  // TODO: implement outputQualificationIdValid
  Stream<bool> get outputQualificationIdValid => throw UnimplementedError();

  @override
  setAcdemicDegreeTypeId(int AcademicDegreeTypeId) {
    // TODO: implement setAcdemicDegreeTypeId
    throw UnimplementedError();
  }

  @override
  setDegreeDate(String date) {
    // TODO: implement setDegreeDate
    throw UnimplementedError();
  }

  @override
  // TODO: implement outputEmployeeIdValid
  Stream<bool> get outputEmployeeIdValid => throw UnimplementedError();

  @override
  // TODO: implement outputAcademicDegree
  Stream<bool> get outputAcademicDegree => throw UnimplementedError();

  @override
  // TODO: implement outputDegreeDate
  Stream<bool> get outputDegreeDate => throw UnimplementedError();

  @override
  // TODO: implement outputMajor
  Stream<bool> get outputMajor => throw UnimplementedError();

  @override
  // TODO: implement outputNotes
  Stream<bool> get outputNotes => throw UnimplementedError();

  @override
  // TODO: implement outputUniversity
  Stream<bool> get outputUniversity => throw UnimplementedError();
}

abstract class AcademicDegreeViewModelInput{

  Sink get inputId;
  Sink get inputMajor;
  Sink get inputUniversity;
  Sink get inputNotes;
  Sink get inputEmployeeId;
  Sink get inputAcademicDegreeTypeId;
  Sink get inputGradeId;
  Sink get inputDegreeDate;
  addAcdemicDegree();
  setDegreeDate(String date);
  setGradeId(int gradeId);
  setAcademicDegreeTypeId(int AcademicDegreeTypeId);
  setEmployeeId(int employeeId);
}

abstract class AcademicDegreeViewModelOutput{
  Stream<bool> get outputDegreeDate;
  Stream<bool> get outputMajor;
  Stream<bool> get outputUniversity;
  Stream<bool> get outputNotes;

  Stream<bool> get outputAcademicDegree;
}