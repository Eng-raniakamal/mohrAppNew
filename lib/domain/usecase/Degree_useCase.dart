import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class DegreeUseCase implements BaseUseCase<DegreeUseCaseInput ,DegreeObject > {

  final Repository _repository;
  DegreeUseCase(this._repository);

  @override
  Future<Either<Failure,DegreeObject>> execute(
      DegreeUseCaseInput input) async {
    return await _repository.getDegree(UserRequest(
        input.userId));
  }
}

class DegreeUseCaseInput{
  String userId;
  DegreeUseCaseInput(this.userId);
}
