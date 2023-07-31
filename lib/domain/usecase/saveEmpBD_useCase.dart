
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class saveEmpBasicDataUseCase implements BaseUseCase<saveEmpBasicDataUseCaseInput, EmployeeBasicDataModel> {

  final Repository _repository;
  saveEmpBasicDataUseCase(this._repository);

  @override
  Future<Either<Failure, EmployeeBasicDataModel>> execute(
      saveEmpBasicDataUseCaseInput input) async {
    return await _repository.saveEmployeeBasicData(
        EmployeeBasicDataRequest(
            input.userId,
            input.employee,
            input.address

            //input.empId,input.ArabicName,input.EnglishName,

            //input.BirthDate,input.NationalId,input.SocialId,
            //input.Email,input.Phone,input.Emergency_Number,
           // input.AddressText,input.DistrictId,input.PoBox,
            //input.ZipCode
        ));
  }
}

class saveEmpBasicDataUseCaseInput
{
  String userId;
  int empId;
  Employee employee;
  // String ArabicName;
  // String EnglishName;
  // String BirthDate;
  // String NationalId;
  // String SocialId;
  // String Email;
  // String Phone;
  // String Emergency_Number;
  Address address;
  // String AddressText;
  // int DistrictId;
  // String PoBox;
  // String ZipCode;
  saveEmpBasicDataUseCaseInput(this.userId,
      this.empId,
      this.employee,
      // this.ArabicName,this.EnglishName,
      // this.BirthDate,
      // this.NationalId,
      // this.SocialId,
      // this.Email,
      // this.Phone,
      // this.Emergency_Number,
      this.address
      // this.AddressText,
      // this.DistrictId,
      // this.PoBox,
      // this.ZipCode
  );
}