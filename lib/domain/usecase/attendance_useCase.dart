//
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';



class AttendanceUseCase implements BaseUseCase<AttendanceUseCaseInput ,AttendanceObject> {

  final Repository _repository;

  AttendanceUseCase(this._repository);
  @override
  Future<Either<Failure, AttendanceObject>> execute(
      AttendanceUseCaseInput input) async {
    return await _repository.getAttendance(AttendanceRequest(input.userId));
  }
}

class AttendanceUseCaseInput {
  String userId;
  AttendanceUseCaseInput(this.userId);
}
