import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_vacation_balance/vacation_balance_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';


class GetVacationBalanceUseCase {
  final VacationRepository repository;

  GetVacationBalanceUseCase(this.repository);

  Future<Either<Failure, VacationBalanceResponseModel>> call({
    required VacationBalanceRequestModel requestModel,
  }) {
    return repository.getVacationBalance(requestModel: requestModel);
  }
}
