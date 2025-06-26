import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/data_source/remote/vacation_remote_data_source.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_requests/get_vacation_requests_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

import '../../model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class VacationRepositoryImpl implements VacationRepository {
  VacationRemoteDataSource vacationRemoteDataSource;

  VacationRepositoryImpl({required this.vacationRemoteDataSource});

  @override
  Future<Either<Failure, List<VacationTypeModel>>> getVacationType() async {
    try {
      final result = await vacationRemoteDataSource.getVacationType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationType  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<DefaultReviewerModel>>> getDefaultReviewer({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.getDefaultReviewer(
        requestDefaultReviewerModel: requestDefaultReviewerModel,
      );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادمgetDefaultReviewer  "),
      );
    }
  }

  @override
  Future<Either<Failure, PostVacationResponseModel>> postVacation({
    required PostVacationRequestModel postVacationModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.postVacation(
        postVacationModel: postVacationModel,
      );

      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()} postVacation حدث خطأ في الخادم"),
      );
    }
  }

  @override
  Future<Either<Failure, CalculateVacationDurationResponseModel>>
  calculateVacationDuration(
    CalculateVacationDurationRequestModel calculateVacationDurationRequestModel,
  ) async {
    {
      try {
        final result = await vacationRemoteDataSource.calculateVacationDuration(
          calculateVacationDurationRequestModel,
        );

        return right(result);
      } catch (e) {
        return left(
          ServerFailure(
            "${e.toString()} calculateVacationDuration حدث خطأ في الخادم",
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ValidateVacationResponseModel>> validateVacation({
    required ValidateVacationRequestModel requestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.validateVacation(
        requestModel: requestModel,
      );
      return right(result);
    } on DioException catch (e) {
      final errorMessage = ErrorHandler.getErrorMessage(e);
      return left(ServerFailure(errorMessage));
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادمvalidateVacation "),
      );
    }
  }

  @override
  Future<Either<Failure, CheckHandledAlertsResponseModel>> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  }) async {
    try {
      final result = await vacationRemoteDataSource.checkHandledAlerts(
        requestModel: requestModel,
      );
      return Right(result);
    } on DioException catch (e) {
      final errorMessage = ErrorHandler.getErrorMessage(e);
      return left(ServerFailure(errorMessage));
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}checkHandledAlertsحدث خطأ في الخادم "),
      );
    }
  }

  @override
  Future<Either<Failure, VacationBalanceResponseModel>> getVacationBalance({
    required VacationBalanceRequestModel requestModel,
  }) async{
    try {
      final result = await vacationRemoteDataSource.getVacationBalance(
        requestModel: requestModel,
      );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getVacationBalance"),
      );
    }

  }

  @override
  Future<Either<Failure, List<GetEmployeeVacationsResponseModel>>> getEmployeeVacations()
  async
  {
try {
      final result = await vacationRemoteDataSource.getEmployeeVacations();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getEmployeeVacations"),
      );
    }
  }

  @override
  Future<Either<Failure, List<GetVacationRequestsResponseModel>>> getVacationRequests()
  async
  {
    try {
      final result = await vacationRemoteDataSource.getVacationRequests();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getEmployeeVacations"),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> approveCancelRequest({required ApproveCancelRequestModel approveCancelRequestModel})
  async {
    try {
      final result = await vacationRemoteDataSource.approveCancelRequest(approveCancelRequestModel: approveCancelRequestModel,);
      return right(result);
    } catch (e) {
      return left(ServerFailure("${e.toString()}حدث خطأ في الخادم approveCancelRequest"),);
    }

  }
}
