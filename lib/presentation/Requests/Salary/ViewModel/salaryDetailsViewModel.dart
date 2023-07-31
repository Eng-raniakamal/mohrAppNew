
import 'dart:async';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/salaryDetails_UseCase.dart';
import 'package:mohr_hr/domain/usecase/salary_UseCase.dart';

import 'package:mohr_hr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_renderer.dart';

import '../../../common/freezed_data_classes.dart';



class SalaryDetailsViewModel extends BaseViewModel with
    SalaryDetailsViewModelInputs,SalaryDetailsViewModelOutputs {

  final StreamController _UserIdStreamController= StreamController<String>.broadcast();

  //from rxdart
  final _SalaryDetailsStreamController = BehaviorSubject<SalaryDetails>();

  final AppPreferences _appPreferences = instance <AppPreferences>();

  final SalaryDetailsUseCase _SalaryDetailsUseCase;

  SalaryDetailsViewModel(this._SalaryDetailsUseCase);
  String? uId;

  //---Inputs
  @override
  void start() {
    getSalaryDetailsData();
  }

  @override
  void dispose()
  {
    _UserIdStreamController.close();
    _SalaryDetailsStreamController.close();
    super.dispose();
  }

  @override
  getSalaryDetailsData()
  async{
    uId=await _appPreferences.getUserToken();
    var salaryObject=SalaryObjects(uId!);
    salaryObject.userID;
    if(salaryObject.userID!=null)
    {
      inputState.add(LoadingState(
          stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _SalaryDetailsUseCase.execute
        (SalaryDetailsUseCaseInput(salaryObject.userID)))
          .fold(
              (failure) =>{
            inputState.add(ErrorState(
                StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (salarydata){
            inputState.add(ContentState());
            inputSalary.add(SalaryDetails(
                salarydata.data.employeeName,
                salarydata.data.month,
                salarydata.data.benefitItems,
                salarydata.data.deductedItems,
                salarydata.data.totalBenefits,
                salarydata.data.totalDeductions,
                salarydata.data.paySlipItems,
                salarydata.data.NetSalary,
                salarydata.data.Max,
                salarydata.data.hideNetSalary));

          }
      );}
    else
    {
      salaryObject;
      inputState.add(
          LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
      );
      (await _SalaryDetailsUseCase.execute
        (SalaryDetailsUseCaseInput(salaryObject.userID))).fold(
              (failure) =>{ inputState.add
            (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
          },
              (data){
            inputState.add(ContentState());
            SalaryData.add(SalaryObject);
          }
      );

    }
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get SalaryData => _SalaryDetailsStreamController.sink;

  @override
  Sink get inputSalary => _SalaryDetailsStreamController.sink;

  @override
  Stream<SalaryDetails> get outputSalarys =>
      _SalaryDetailsStreamController.stream.
      map((salary) => salary);
}

abstract class SalaryDetailsViewModelInputs{
  Sink get inputUserId;
  Sink get inputSalary;
}

abstract class SalaryDetailsViewModelOutputs{
  Stream<SalaryDetails> get outputSalarys;
}
// class  SalaryDetailsViewObject {
//   List<Benefit> benefit;
//   List<Deducted> deducted;
//   SalaryDetails salary;
//   SalaryDetailsViewObject(this.benefit,this.deducted,this.salary);
// }
