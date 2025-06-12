
import 'package:essmohr/presentation/newDesign/core/service/api_service/api_service.dart';
import 'package:essmohr/presentation/newDesign/core/utils/end_point.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/data_source/remote/vacation_remote_data_source.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';

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
}
