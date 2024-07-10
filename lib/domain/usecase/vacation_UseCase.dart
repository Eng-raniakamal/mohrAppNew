//
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';


class VacationUseCase implements BaseUseCase<VacationUseCaseInput ,VacationsObject> {

  final Repository _repository;

  VacationUseCase(this._repository);
  @override
  Future<Either<Failure, VacationsObject>> execute(
      VacationUseCaseInput input) async {
      return await _repository.getVacations(VacationRequest(
        input.userId));
  }
}

class VacationUseCaseInput {
  String userId;
  VacationUseCaseInput(this.userId);
}
