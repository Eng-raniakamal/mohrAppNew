//
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
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
