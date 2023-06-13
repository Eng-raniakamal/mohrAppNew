
import 'dart:async';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/vacation_UseCase.dart';
import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';

import '../../../common/freezed_data_classes.dart';



class VacationViewModel extends BaseViewModel with
    VacationViewModelInputs,VacationViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();

  //from rxdart
  final _VacationsStreamController = BehaviorSubject<VacationViewObject>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  final VacationUseCase _VacationUseCase;

  VacationViewModel(this._VacationUseCase);
  String? uId;

  //---Inputs
  @override
  void start() {
    getVacationData();
  }

  @override
  void dispose()
  {
    //_UserIdStreamController.close();
    _VacationsStreamController.close();
    super.dispose();
  }

  @override
  getVacationData()
  async{
    uId=await _appPreferences.getUserToken();
     var VacationObject=VacationsObjects(uId!);
     VacationObject.userID;
    if(VacationObject.userID!=null)
    {
      inputState.add(LoadingState(
          stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _VacationUseCase.execute
        (VacationUseCaseInput(VacationObject.userID)))
          .fold(
              (failure) =>{
                inputState.add(ErrorState(
                    StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (vacationdata){
            inputState.add(ContentState());
            inputVacation.add(VacationViewObject(
                vacationdata.vacationsData.vactions));
               // vacationsData.vactions,
            //VacationData.add(VacationObject);
          }
      );}
    else
    {
      VacationObject;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _VacationUseCase.execute
        (VacationUseCaseInput(VacationObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            VacationData.add(VacationObject);
          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get VacationData => _VacationsStreamController.sink;
  Snik get VacationsData => _VacationsStreamController;
  


  @override
  Sink get inputVacation => _VacationsStreamController.sink;

  @override
  Stream<VacationViewObject> get outputVacations =>
      _VacationsStreamController.stream.
      map((vacations) => vacations);
}

abstract class VacationViewModelInputs{
  Sink get inputUserId;
  Sink get inputVacation;
}

abstract class VacationViewModelOutputs{
 // Stream<VacationsData> get outputVacationsData;
  Stream<VacationViewObject> get outputVacations;

}
class  VacationViewObject {
 List<Vacation > vacations;

  VacationViewObject(this.vacations);
}
