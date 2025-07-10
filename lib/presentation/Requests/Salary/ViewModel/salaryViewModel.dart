//
// import 'dart:async';
// import 'package:essmohr/application/app_prefs.dart';
// import 'package:essmohr/application/di.dart';
// import 'package:essmohr/domain/model/model.dart';
// import 'package:essmohr/domain/usecase/salary_UseCase.dart';
//
// import 'package:essmohr/presentation/Base/baseviewmodel.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
// import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
//
 import '../../../common/freezed_data_classes.dart';
//
//
//
// class SalaryViewModel extends BaseViewModel implements
//     SalaryViewModelInputs,SalaryViewModelOutputs {
//
//   final StreamController _UserIdStreamController= StreamController<String>.broadcast();
//
//   //from rxdart
//   final _SalaryStreamController = BehaviorSubject<SalaryViewObject>();
//
//   final AppPreferences _appPreferences = instance <AppPreferences>();
//   String cachedSalaryKey = 'cached_salary_list';
//
//   final SalaryUseCase _SalaryUseCase;
//
//   SalaryViewModel(this._SalaryUseCase);
//   String? uId;
//
//   //---Inputs
//   @override
//   void start() {
//     getSalaryData();
//   }
//
//   @override
//   void dispose()
//   {
//     //_UserIdStreamController.close();
//     _SalaryStreamController.close();
//     super.dispose();
//   }
//
//
//
//   @override
//   getSalaryData()
//   async{
//     uId=await _appPreferences.getUserToken();
//     var salaryObject=SalaryObjects(uId!);
//     salaryObject.userID;
//     if(salaryObject.userID!=null)
//     {
//       inputState.add(LoadingState(
//           stateRendererType:StateRendererType.POPUP_LOADING_STATE)
//       );
//       (await _SalaryUseCase.execute
//         (SalaryUseCaseInput(salaryObject.userID)))
//           .fold(
//               (failure) =>{
//             inputState.add(ErrorState(
//                 StateRendererType.POPUP_ERROR_STATE,failure.message))
//           },
//               (salarydata){
//             inputState.add(ContentState());
//             inputSalary.add(SalaryViewObject(
//                 salarydata.salaryData.salary));
//
//           }
//       );}
//     else
//     {
//       salaryObject;
//       inputState.add(
//           LoadingState(stateRendererType:StateRendererType.POPUP_LOADING_STATE)
//       );
//       (await _SalaryUseCase.execute
//         (SalaryUseCaseInput(salaryObject.userID))).fold(
//               (failure) =>{ inputState.add
//             (ErrorState(StateRendererType.POPUP_ERROR_STATE,failure.message))
//           },
//               (data){
//             inputState.add(ContentState());
//             SalaryData.add(SalaryObject);
//           }
//       );
//
//     }
//   }
//
//   @override
//   Sink get inputUserId => _UserIdStreamController.sink;
//
//   @override
//   Sink get SalaryData => _SalaryStreamController.sink;
//
//   @override
//   Sink get inputSalary => _SalaryStreamController.sink;
//
//   @override
//   Stream<SalaryViewObject> get outputSalarys =>
//       _SalaryStreamController.stream.
//       map((salary) => salary);
// }
//
// abstract class SalaryViewModelInputs{
//   Sink get inputUserId;
//   Sink get inputSalary;
// }
//
// abstract class SalaryViewModelOutputs{
//   Stream<SalaryViewObject> get outputSalarys;
// }
// class  SalaryViewObject {
//   List<SalaryItems> salary;
//   SalaryViewObject(this.salary);
// }
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/salary_UseCase.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import '../../../common/freezed_data_classes.dart';

class SalaryViewModel extends BaseViewModel implements SalaryViewModelInputs, SalaryViewModelOutputs {
  final StreamController _UserIdStreamController = StreamController<String>.broadcast();
  final _SalaryStreamController = BehaviorSubject<SalaryViewObject>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String cachedSalaryKey = 'cached_salary_list';
  final SalaryUseCase _SalaryUseCase;

  SalaryViewModel(this._SalaryUseCase);
  String? uId;

  @override
  void start() async {
    final cachedList = await _getCachedSalaryList();
    if (cachedList.isNotEmpty) {
      inputSalary.add(SalaryViewObject(cachedList));
    }
    getSalaryData();
  }

  @override
  void dispose() {
    _SalaryStreamController.close();
    super.dispose();
  }

  @override
  getSalaryData() async {
    uId = await _appPreferences.getUserToken();
    var salaryObject = SalaryObjects(uId!);

    if (salaryObject.userID != null) {
     // inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

      (await _SalaryUseCase.execute(SalaryUseCaseInput(salaryObject.userID))).fold(
            (failure) => {
          inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message))
        },
            (salarydata) async {
          inputState.add(ContentState());
          inputSalary.add(SalaryViewObject(salarydata.salaryData.salary));
          await _cacheSalaryList(salarydata.salaryData.salary);
        },
      );
    }
  }

  Future<void> _cacheSalaryList(List<SalaryItems> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((item) => {
      'id': item.id,
      'Month': item.Month,
      'Value': item.Value,
    }).toList();
    await prefs.setString(cachedSalaryKey, jsonEncode(jsonList));
  }

  Future<List<SalaryItems>> _getCachedSalaryList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(cachedSalaryKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => SalaryItems(e['id'], e['Month'], (e['Value'] as num).toDouble())).toList();
    }
    return [];
  }

  @override
  Sink get inputUserId => _UserIdStreamController.sink;

  @override
  Sink get SalaryData => _SalaryStreamController.sink;

  @override
  Sink get inputSalary => _SalaryStreamController.sink;

  @override
  Stream<SalaryViewObject> get outputSalarys =>
      _SalaryStreamController.stream.map((salary) => salary);
}

abstract class SalaryViewModelInputs {
  Sink get inputUserId;
  Sink get inputSalary;
}

abstract class SalaryViewModelOutputs {
  Stream<SalaryViewObject> get outputSalarys;
}

class SalaryViewObject {
  List<SalaryItems> salary;
  SalaryViewObject(this.salary);
}
