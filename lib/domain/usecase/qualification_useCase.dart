import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class QualificationUseCase implements BaseUseCase<QualificationUseCaseInput ,QualificationsObject > {

  final Repository _repository;
  QualificationUseCase(this._repository);

  @override
  Future<Either<Failure,QualificationsObject>> execute(
      QualificationUseCaseInput input) async {
    return await _repository.getQualification(qualificationRequest(
        input.userId));
  }
}

class QualificationUseCaseInput{
  String userId;
  QualificationUseCaseInput(this.userId);
}
