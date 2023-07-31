//
// import 'package:mohr_hr/data/networks/failure.dart';
// import 'package:mohr_hr/data/request/request.dart';
// import 'package:mohr_hr/data/response/responses.dart';
// import 'package:mohr_hr/domain/model/model.dart';
//
// import 'package:mohr_hr/domain/repository/repository.dart';
// import 'package:mohr_hr/domain/usecase/base_usecase.dart';
// import 'package:dartz/dartz.dart';
//
//
//
// class EmployeeBasicDataUseCase implements BaseUseCase<EmployeeBasicInput ,BasicDataModel> {
//
//   final Repository _repository;
//
//   EmployeeBasicDataUseCase (this._repository);
//   @override
//   Future<Either<Failure,BasicDataModel>> execute(
//       EmployeeBasicInput input,) async {
//     return await _repository.DisplayEmployeeBasicData(BasicDataRequest(input.userId, input.empId));
//   }
// }
//
// class EmployeeBasicInput {
//   String userId;
//   int empId;
//   EmployeeBasicInput(this.userId,this.empId);
// }
//
//


import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';



class BasicDataUseCase implements BaseUseCase<BasicdataInput ,BasicDataModel> {

  final Repository _repository;

 BasicDataUseCase (this._repository);
  @override
  Future<Either<Failure,BasicDataModel>> execute(
      BasicdataInput input,) async {
    return await _repository.displayEmployeeBasicData(BasicDataRequest(input.userId, input.empId));
  }
}

class BasicdataInput {
  String userId;
  int empId;
  BasicdataInput(this.userId,this.empId);
}


