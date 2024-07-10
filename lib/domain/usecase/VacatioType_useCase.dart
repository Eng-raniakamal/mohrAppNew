//
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


class VacationTypeUseCase extends BaseUseCase<void, VacationTypeObject> {
  Repository repository;

  VacationTypeUseCase(this.repository);

  @override
  Future<Either<Failure, VacationTypeObject>> execute(void input) {
    return repository.getVacationType();
  }
}