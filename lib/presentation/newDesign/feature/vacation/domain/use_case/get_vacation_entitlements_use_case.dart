import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';

import '../../../../../../domain/model/model.dart';

import '../repository/vacation_repository.dart';





class GetVacationEntitlementsUseCase  {
  final VacationRepository repository;

  GetVacationEntitlementsUseCase(this.repository);

  Future<Either<Failure, List<VacationTypeBalancs>>> call() {
    return repository.getVacationEntitlements();
  }
}