import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
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
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/entity/vacation_type_entity.dart';

abstract class VacationRepository {
  Future<Either<Failure, List<VacationTypeEntity>>> getVacationType();

  Future<Either<Failure, List<DefaultReviewerModel>>> getDefaultReviewer(
      {required RequestDefaultReviewerModel requestDefaultReviewerModel}
      );

  Future<Either<Failure,PostVacationResponseModel>> postVacation({
    required PostVacationRequestModel postVacationModel,
  });

  Future<Either<Failure,CalculateVacationDurationResponseModel>> calculateVacationDuration(
      CalculateVacationDurationRequestModel calculateVacationDurationRequestModel,
      );

  Future<Either<Failure, ValidateVacationResponseModel>> validateVacation({
    required ValidateVacationRequestModel requestModel,
  });

  Future<Either<Failure, CheckHandledAlertsResponseModel>> checkHandledAlerts({
    required CheckHandledAlertsRequestModel requestModel,
  });

  Future<Either<Failure, VacationBalanceResponseModel>> getVacationBalance({
    required VacationBalanceRequestModel requestModel,
  });


}
