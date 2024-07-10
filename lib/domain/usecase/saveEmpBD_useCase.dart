
import 'package:essmohr/data/mapper/mapper.dart';
import 'package:essmohr/data/networks/failure.dart';
import 'package:essmohr/data/request/request.dart';
import 'package:essmohr/data/response/responses.dart';
import 'package:essmohr/domain/model/model.dart';

import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/base_usecase.dart';
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