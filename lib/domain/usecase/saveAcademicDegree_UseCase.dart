
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class saveAcademicDegreeUseCase implements BaseUseCase<SaveAcademicDegreeUseCaseInput, SaveAcademicDegreeModel> {

  final Repository _repository;
  saveAcademicDegreeUseCase(this._repository);

  @override
  Future<Either<Failure, SaveAcademicDegreeModel>> execute(
      SaveAcademicDegreeUseCaseInput input) async {
    return await _repository.saveAcademicDegree(
        SaveAcademicDegreeRequest(
        input.userId,
        input.id,
        input.major,
        input.university,
        input.notes,
        input.employeeId,
        input.academicDegreeTypeId,
        input.GradeId,
        input.DegreeDate));
  }
}

class SaveAcademicDegreeUseCaseInput
{
  String userId;
  int id;
  String major;
  String university;
  String notes;
  int employeeId;
  int academicDegreeTypeId;
  int GradeId;
  String DegreeDate;

  SaveAcademicDegreeUseCaseInput(this.userId,this.id,
      this.major,this.university,
      this.notes,
      this.employeeId,
      this.academicDegreeTypeId,
      this.GradeId,
      this.DegreeDate,);
}