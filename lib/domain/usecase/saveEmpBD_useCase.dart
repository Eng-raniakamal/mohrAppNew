
import 'package:mohr_hr/data/mapper/mapper.dart';
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class saveEmpBasicDataUseCase implements BaseUseCase<saveEmpBasicDataUseCaseInput, EmployeeSaveBasicDataModel> {

  final Repository _repository;
  saveEmpBasicDataUseCase(this._repository);

  @override
  Future<Either<Failure, EmployeeSaveBasicDataModel>> execute(
      saveEmpBasicDataUseCaseInput input) async {
    return await _repository.saveEmployeeBasicData(
        EmployeeBasicDataRequest(
            input.userId,
            input.emp.toResponse(),
            input.address.toResponse()

        ));
  }
}

class saveEmpBasicDataUseCaseInput
{
  String userId;
  EmployeeSaveModel emp;
  AddressSaveModel address;
  saveEmpBasicDataUseCaseInput(this.userId, this.emp, this.address
  );
}