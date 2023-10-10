//
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


class VacationTypeUseCase extends BaseUseCase<void, VacationTypeObject> {
  Repository repository;

  VacationTypeUseCase(this.repository);

  @override
  Future<Either<Failure, VacationTypeObject>> execute(void input) {
    return repository.getVacationType();
  }
}