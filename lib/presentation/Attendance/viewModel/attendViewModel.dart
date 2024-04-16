
import 'dart:async';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
//import 'package:mohr_hr/domain/usecase/attendanceDetails_UseCase.dart';
import 'package:mohr_hr/domain/usecase/attendance_UseCase.dart';

import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';

import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';



class AttendanceViewModel extends BaseViewModel with
    AttendanceViewModelInputs,AttendanceViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();
  final StreamController _fromStreamController= StreamController<String>.broadcast();
  final StreamController _toStreamController= StreamController<String>.broadcast();

  //from rxdart
  final _AttendanceStreamController = BehaviorSubject<AttendanceViewObject>();

  final AppPreferences _appPreferences = instance <AppPreferences>();

  final AttendanceUseCase _AttendanceUseCase;

  AttendanceViewModel(this._AttendanceUseCase);
  String? uId;
  DateTime? from;
  DateTime? to;
  //---Inputs
  @override
  void start() {
    getAttendanceData();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _AttendanceStreamController.close();
    super.dispose();
  }

  @override
  getAttendanceData()
  async{
    uId=await _appPreferences.getUserToken();
    var attendanceObject;
    //attendanceObjects(uId!);
   // attendanceObject.userID;
    if(uId!=null)
    {
      inputState.add(LoadingState(
          stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _AttendanceUseCase.execute
        (AttendanceUseCaseInput(attendanceObject.userID)))
          .fold(
              (failure) =>{
            inputState.add(ErrorState(
                StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (attendancedata){
            inputState.add(ContentState());
            inputattendance.add(AttendanceList(attendancedata.attendancedata.attendanceList));

          }
      );}
    else
    {
      attendanceObject;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _AttendanceUseCase.execute
        (AttendanceUseCaseInput(attendanceObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            attendanceData.add(attendanceObject);
          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get attendanceData => _AttendanceStreamController.sink;

  @override
  Sink get inputattendance => _AttendanceStreamController.sink;

  @override
  Stream<AttendanceViewObject> get outputattendances =>
      _AttendanceStreamController.stream.
      map((attendance) => attendance);

  @override
  Sink get inputFrom =>  _fromStreamController.sink;

  @override
  Sink get inputTo => _toStreamController.sink;
}

abstract class AttendanceViewModelInputs{
  Sink get inputUserId;
  Sink get inputFrom;
  Sink get inputTo;
  //Sink get inputattendance;
}

abstract class AttendanceViewModelOutputs{
  Stream<AttendanceViewObject> get outputattendances;
}

class  AttendanceViewObject {
  List<Attendance> attendance;
  AttendanceViewObject(this.attendance);
}

