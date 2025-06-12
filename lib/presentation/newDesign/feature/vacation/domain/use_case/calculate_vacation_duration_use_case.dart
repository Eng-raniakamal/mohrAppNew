import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class CalculateVacationDurationUseCase{
  VacationRepository vacationRepository;

  CalculateVacationDurationUseCase(this.vacationRepository);

  Future<Either<Failure, CalculateVacationDurationResponseModel>>call(
      CalculateVacationDurationRequestModel calculateVacationDurationRequestModel) async {
    return await vacationRepository.calculateVacationDuration(calculateVacationDurationRequestModel);
  }
}