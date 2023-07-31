import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
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
