//
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
//
// class DisplayVacationUseCase implements BaseUseCase<displayVacationUseCaseInput ,displayVactionsModel> {
//
//   final Repository _repository;
//
//   DisplayVacationUseCase(this._repository);
//
//
//   @override
//   Future<Either<Failure, displayVactionsModel>> execute(
//       displayVacationUseCaseInput input) async {
//     return await _repository.getVacationsOfEmployee(disPlayVacationRequest
//       (
//       input.userId,
//       input.employeeId,
//       input.vacationTypeName,
//       input.vacationTypeDuration,
//       input.transferred,
//       input.total,
//       input.consumed,
//       input.available,
//       input.pending
//       )
//     );
//
//   }
// }
//
// class displayVacationUseCaseInput {
//   String userId;
//   String employeeId;
//   String vacationTypeName;
//   String vacationTypeDuration;
//   String transferred;
//   String total;
//   String consumed;
//   String available;
//   String pending;
//   displayVacationUseCaseInput(this.userId,this.employeeId,this.vacationTypeName,this.vacationTypeDuration,
//       this.transferred,this.total,this.consumed,this.available,this.pending);
// }
//

// import 'package:mohr_hr/data/networks/failure.dart';
// import 'package:mohr_hr/data/request/request.dart';
// import 'package:mohr_hr/domain/model/model.dart';
// import 'package:mohr_hr/domain/repository/repository.dart';
// import 'package:mohr_hr/domain/usecase/base_usecase.dart';
// import 'package:dartz/dartz.dart';
//
 import '../../application/app_prefs.dart';
import '../../application/di.dart';

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
