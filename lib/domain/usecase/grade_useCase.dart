import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GradeUseCase implements BaseUseCase<GradeUseCaseInput ,GradesObject > {

  final Repository _repository;
  GradeUseCase(this._repository);

  @override
  Future<Either<Failure,GradesObject>> execute(
      GradeUseCaseInput input) async {
    return await _repository.getGrade(GradeRequest(
        input.userId));
  }
}

class GradeUseCaseInput{
  String userId;
  GradeUseCaseInput(this.userId);
}
