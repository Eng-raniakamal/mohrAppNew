import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class CheckHandledAlertsUseCase {
  final VacationRepository repository;

  CheckHandledAlertsUseCase(this.repository);

  Future<Either<Failure, CheckHandledAlertsResponseModel>> call(
      CheckHandledAlertsRequestModel requestModel,
      ) async {
    return await repository.checkHandledAlerts(requestModel: requestModel);
  }
}
