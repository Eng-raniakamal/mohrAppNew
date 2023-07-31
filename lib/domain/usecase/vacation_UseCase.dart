//
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
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
