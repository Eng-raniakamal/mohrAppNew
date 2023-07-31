

import 'dart:async';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';
import '../../../domain/usecase/empBD_useCase.dart';
import 'package:mohr_hr/presentation/common/freezed_data_classes.dart';


class EmployeeBasicDataViewModel extends BaseViewModel with
    EmpBasicDataViewModelInputs,EmpBasicDataViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();
  final StreamController _EmpIdStreamController= StreamController<int>.broadcast();

  //from rxdart
  final _BasicDataStreamController = BehaviorSubject<BasicDataModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final BasicDataUseCase _BasicDataUseCase;
  EmployeeBasicDataViewModel ( this._BasicDataUseCase);
  String? uId;
  int? empId;
  var empObject;
  //empObject("",0);

  //---Inputs
  @override
  void start() {
    getEmpBasicData();
  }


  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _EmpIdStreamController.close();
    super.dispose();
  }

  @override
  getEmpBasicData()
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
      (await _BasicDataUseCase.execute
        (BasicdataInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{
            inputState.add(ErrorState(
                StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpBasicData.add(BasicDataModel(data.employee,data.allowEdit,
                data.country,data.selectedcountry,data.governorate,data.selectedgovernorate
                ,data.district,data.selectedgovernorate,data.address));
    });
    }
    else
    {
      empObject.userID;
      empObject.empId;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _BasicDataUseCase.execute

        (BasicdataInput(empObject.userID,empObject.empId))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            EmpBasicData.add(BasicDataModel(data.employee,data.allowEdit,
            data.country,data.selectedcountry,data.governorate,data.selectedgovernorate
            ,data.district,data.selectedgovernorate,data.address));

          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get inputEmpId => _EmpIdStreamController.sink;


  @override
  Sink get EmpBasicData => _BasicDataStreamController.sink;



  @override
  Stream<BasicDataModel> get outputEmpBasicData => _BasicDataStreamController.stream.
  map((data) => data);
}

abstract class EmpBasicDataViewModelInputs{
  Sink get inputUserId;
  Sink get inputEmpId;
}

abstract class EmpBasicDataViewModelOutputs{
  Stream<BasicDataModel> get outputEmpBasicData;

}
class  EmpBasicDataViewObject {
  BasicDataModel employeeBasicData;
  EmpBasicDataViewObject(this.employeeBasicData);
}



