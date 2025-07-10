import 'dart:convert';

import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/newDesign/core/service/api_service/api_service.dart';
import 'package:essmohr/presentation/newDesign/core/utils/end_point.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/data_source/remote/vacation_remote_data_source.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_requests/get_vacation_requests_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../../application/di.dart';
import '../../model/get_employee_vacations_model/get_employee_vacations_response_model.dart';
import 'package:http/http.dart' as http;


class VacationRemoteImplDio implements VacationRemoteDataSource {
  final ApiService apiService;

  VacationRemoteImplDio({required this.apiService});

  @override
  Future<List<VacationTypeModel>> getVacationType() async {
    final response = await apiService.getRequest(endPoint: EndPoint.vacationTypes);
    List<dynamic> listJson = response.data;
    return listJson.map((e) => VacationTypeModel.fromJson(e)).toList();
  }

  @override
  Future<List<DefaultReviewerModel>> getDefaultReviewer({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  }) async {
    final queryParams = {
      "requestType": requestDefaultReviewerModel.requestType,
      "date": requestDefaultReviewerModel.date,
      "requestedTypeId": requestDefaultReviewerModel.requestedTypeId,
    };

    final response = await apiService.getRequest(
      endPoint: EndPoint.defaultReviewer,
      queryParams: queryParams,
    );
    List<dynamic> listJson = response.data;
    return listJson.map((e) => DefaultReviewerModel.fromJson(e)).toList();
  }

  @override
  Future<PostVacationResponseModel> postVacation({
    required PostVacationRequestModel postVacationModel,
  }) async {
    final response = await apiService.postRequest(
      endPoint: EndPoint.postVacation,
      data: postVacationModel.toJson(),

    );
    return PostVacationResponseModel.fromJson(response.data);
  }

  @override
  Future<CalculateVacationDurationResponseModel> calculateVacationDuration(
    CalculateVacationDurationRequestModel requestModel,
  ) async {
    final queryParams = {
      'fromDate': requestModel.fromDate.toIso8601String(),
      'toDate': requestModel.toDate.toIso8601String(),
      'vacationTypeId': requestModel.vacationTypeId.toString(),
      'unit': requestModel.unit.toString(),
      if (requestModel.replacementId != null)
        'replacementId': requestModel.replacementId.toString(),
    };

    final response = await apiService.getRequest(
      endPoint: EndPoint.calculateVacationDuration,
      queryParams: queryParams,
    );
    return CalculateVacationDurationResponseModel.fromJson(response.data);
  }

  @override
  Future<ValidateVacationResponseModel> validateVacation({
    required ValidateVacationRequestModel requestModel,
  }) async {
    final queryParams = {
      'vacationTypeId': requestModel.vacationTypeId.toString(),
      'fromDate': requestModel.fromDate.toIso8601String(),
      'toDate': requestModel.toDate.toIso8601String(),
      'duration': requestModel.duration.toString(),
      'id': requestModel.id?.toString() ?? '0', // Default to 0 if id is null
    };

    final response = await apiService.getRequest(
     endPoint: EndPoint.validateVacation,
      queryParams: queryParams,
    );
    return ValidateVacationResponseModel.fromJson(response.data);
  }

  @override
  Future<CheckHandledAlertsResponseModel> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  }) async {
    final response = await apiService.getRequest(
      endPoint: EndPoint.checkHandledAlerts,
      queryParams: requestModel.toQueryParams(),
    );
    return CheckHandledAlertsResponseModel.fromJson(response.data);
  }

  @override
  Future<VacationBalanceResponseModel> getVacationBalance({
    required VacationBalanceRequestModel requestModel,
  })
  async
  {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getBalance,
      queryParams: requestModel.toQueryParams(),
    );
    return VacationBalanceResponseModel.fromJson(response.data);
  }

  @override
  Future<List<GetEmployeeVacationsResponseModel>> getEmployeeVacations()
  async
  {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getVacations,
    );
    return response.data.map<GetEmployeeVacationsResponseModel>(
      (json) => GetEmployeeVacationsResponseModel.fromJson(json),
    ).toList();

  // return Future.value(GetEmployeeVacationsModel.listVacationEmployee);
  // return [];
  }

  @override
  Future<List<GetVacationRequestsResponseModel>> getVacationRequests()
  async
  {
    final response = await apiService.getRequest(
      endPoint: EndPoint.getVacationRequests,
    );
    return response.data.map<GetVacationRequestsResponseModel>(
          (json) => GetVacationRequestsResponseModel.fromJson(json),
    ).toList();

    // return Future.value(GetEmployeeVacationsModel.listVacationEmployee);
  }

  @override
  Future<bool> approveCancelRequest({required ApproveCancelRequestModel approveCancelRequestModel})

  async {
    final response = await apiService.putRequest(
      endPoint: EndPoint.approveCancelRequest,
      data: approveCancelRequestModel.toJson(),
    );
    return response.data ;

  }

  @override
  Future<List<VacationTypeBalancs>> getVacationEntitlements() async {

      final AppPreferences _appPreferences = instance<AppPreferences>();
      String userId = await _appPreferences.getUserToken();

      final response = await http.get(
        Uri.parse(Constants.getVacationTypesBalances),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'userId': userId,
        },
      );

      final responseData = json.decode(response.body);
      if (responseData != null) {
        final vacationTypesBalances = responseData as List;
        final List<VacationTypeBalancs> b = vacationTypesBalances
            .map((jsonData) => VacationTypeBalancs.fromJson(jsonData))
            .toList();
        return b;
      }

      // لو لم يكن هناك بيانات رجع قائمة فارغة
      return [];
    }
}


