import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class ValidateVacationUseCase {
  final VacationRepository vacationRepository;

  ValidateVacationUseCase(this.vacationRepository);

  Future<Either<Failure, ValidateVacationResponseModel>> call(
    ValidateVacationRequestModel requestModel,
  ) async {
    return await vacationRepository.validateVacation(
      requestModel: requestModel,
    );
  }
}
