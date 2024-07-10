
import 'dart:async';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/VacatioType_useCase.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import 'dart:ffi';


class VacationTypeViewModel extends BaseViewModel implements
    VacationTypeViewModelInputs, VacationTypeViewModelOutputs {
  final _VacationTypeStreamController = BehaviorSubject<VacationTypeObject>();
  //final AppPreferences _appPreferences = instance<AppPreferences>();
  final VacationTypeUseCase _VacationTypeUseCase;
  VacationTypeViewModel(this._VacationTypeUseCase);

  //---Inputs
  @override
  void start() {
    _getVacationTypeData();
  }

  @override
  void dispose()
  {
    _VacationTypeStreamController.close();
    super.dispose();
  }

  @override
  _getVacationTypeData()
  async{

      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _VacationTypeUseCase.execute(Void)).fold((failure) =>{
        inputState.add(ErrorState(
            StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (VacationTypeObject){
            inputState.add(ContentState());
            inputVacationType.add(VacationTypeObject);
            //VacationTypeData.add(VacationTypeObject(data.vacationType));
          }
      );}

  @override
  Stream<VacationTypeObject> get outputVacationType =>
      _VacationTypeStreamController.stream.map((vactionTypes) => vactionTypes) ;



  @override
Sink get inputVacationType => _VacationTypeStreamController.sink;
    }

 
abstract class VacationTypeViewModelInputs{
  Sink get inputVacationType;
}


abstract class VacationTypeViewModelOutputs {
  Stream<VacationTypeObject> get outputVacationType;
}
