

import 'dart:async';
import 'dart:convert';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/common/state_renderer/state_renderer.dart';
import '../../../domain/usecase/empBD_useCase.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EmployeeBasicDataViewModel extends BaseViewModel
    implements EmpBasicDataViewModelInputs, EmpBasicDataViewModelOutputs {
  final StreamController _userIdStreamController = StreamController<String>.broadcast();
  final _basicDataStreamController = BehaviorSubject<BasicDataModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final BasicDataUseCase _basicDataUseCase;
  final String _cacheKey = 'cached_basic_data';

  EmployeeBasicDataViewModel(this._basicDataUseCase);

  String? uId;
  int? empId;
  bool _isDisposed = false;

  @override
  void start() async {
    final cachedData = await _getCachedBasicData();
    if (cachedData != null) {
      inputBasicData.add(cachedData);
    }
    await getEmpBasicData();
  }

  @override
  void dispose() {
    _userIdStreamController.close();
    _basicDataStreamController.close();
    _isDisposed = true;
    super.dispose();
  }

  Future<void> getEmpBasicData() async {
    uId = await _appPreferences.getUserToken();
    empId = await _appPreferences.getEmpIdToken();

    if (_isDisposed || empId == null || empId == 0) return;

   // inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));

    final result = await _basicDataUseCase.execute(BasicdataInput(uId!, empId!));
    result.fold(
          (failure) {
        if (!_isDisposed) {
          inputState.add(ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
        }
      },
          (data) async {
        if (!_isDisposed) {
          inputState.add(ContentState());

          final model = BasicDataModel(
            data.employee,
            data.allowEdit,
            data.country,
            data.selectedcountry,
            data.governorate,
            data.selectedgovernorate,
            data.district,
            data.selecteddistrict,
            data.address,
          );

          inputBasicData.add(model);
          await _cacheBasicData(model);
        }
      },
    );
  }

  // --------- Caching -------------
  Future<void> _cacheBasicData(BasicDataModel model) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(_basicDataToJson(model));
    await prefs.setString(_cacheKey, jsonString);
  }

  Future<BasicDataModel?> _getCachedBasicData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cacheKey);
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString);
      return _basicDataFromJson(jsonMap);
    }
    return null;
  }

  // ---------- Serialization Manual (BasicDataModel needs this since it has no toJson/fromJson directly) ------------
  Map<String, dynamic> _basicDataToJson(BasicDataModel model) {
    return {
      'employee': {
        'empId': model.employee?.empId,
        'arabicName': model.employee?.arabicName,
        'englishName': model.employee?.englishName,
        'birthDate': model.employee?.birthdate,
        'nationalId': model.employee?.nationalId,
        'socialId': model.employee?.socialId,
        'email': model.employee?.email,
        'phone': model.employee?.phone,
        'emergencyNumber': model.employee?.emergency_Number,
        'address': {
          'addressText': model.employee?.address?.addressText,
          'districtId': model.employee?.address?.districtId,
          'zipCode': model.employee?.address?.zipCode,
        },
      },
      'allowEdit': model.allowEdit,
      'selectedcountry': model.selectedcountry,
      'selectedgovernorate': model.selectedgovernorate,
      'selecteddistrict': model.selecteddistrict,
      'address': {
        'addressText': model.address?.addressText,
        'districtId': model.address?.districtId,
        'zipCode': model.address?.zipCode,
      },
    };
  }

  BasicDataModel _basicDataFromJson(Map<String, dynamic> json) {
    final emp = json['employee'];
    final empAddress = emp['address'];
    final address = json['address'];

    return BasicDataModel(
      EmployeeModel(
        emp['empId'] ?? 0,
        emp['arabicName'] ?? '',
        emp['englishName'] ?? '',
        emp['birthDate'] ?? '',
        emp['nationalId'] ?? '',
        emp['socialId'] ?? '',
        emp['email'] ?? '',
        emp['phone'] ?? '',
        emp['emergencyNumber'] ?? '',
        AddressModel(
          empAddress['addressText'] ?? '',
          empAddress['districtId'] ?? 0,
          empAddress['zipCode'] ?? '',
        ),
      ),
      json['allowEdit'] ?? false,
      [], // You can ignore full lists for cache, or implement same idea for Country/Gov/District if needed.
      json['selectedcountry'] ?? 0,
      [],
      json['selectedgovernorate'] ?? 0,
      [],
      json['selecteddistrict'] ?? 0,
      AddressModel(
        address['addressText'] ?? '',
        address['districtId'] ?? 0,
        address['zipCode'] ?? '',
      ),
    );
  }

  // -------- Inputs / Outputs --------
  @override
  Sink get inputUserId => _userIdStreamController.sink;

  @override
  Sink get inputBasicData => _basicDataStreamController.sink;

  @override
  Stream<BasicDataModel> get outputEmpBasicData => _basicDataStreamController.stream;
}

// ----- Interfaces ------
abstract class EmpBasicDataViewModelInputs {
  Sink get inputUserId;
  Sink get inputBasicData;
}

abstract class EmpBasicDataViewModelOutputs {
  Stream<BasicDataModel> get outputEmpBasicData;
}


