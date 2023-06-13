
import 'package:mohr_hr/data/networks/failure.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:mohr_hr/data/response/responses.dart';
import 'package:mohr_hr/domain/model/model.dart';

import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class EmployeeBasicDataUseCase implements BaseUseCase<EmployeeBasicDataUseCaseInput, EmployeeBasicDataModel> {

  final Repository _repository;
  EmployeeBasicDataUseCase(this._repository);

  @override
  Future<Either<Failure, EmployeeBasicDataModel>> execute(
      EmployeeBasicDataUseCaseInput input) async {
    return await _repository.getEmployeeBasicData(
        EmployeeBasicDataRequest(
        input.userId,input.ArabicName,input.EnglishName,
        input.BirthDate,input.NationalId,input.SocialId,
        input.Email,input.Phone,input.Emergency_Number,
        input.AddressText,input.DistrictId,input.PoBox,
        input.ZipCode));
  }
}

class EmployeeBasicDataUseCaseInput
{
  String userId;
  String ArabicName;
  String EnglishName;
  String BirthDate;
  String NationalId;
  String SocialId;
  String Email;
  String Phone;
  String Emergency_Number;
  String AddressText;
  int DistrictId;
  String PoBox;
  String ZipCode;
  EmployeeBasicDataUseCaseInput(this.userId,
      this.ArabicName,this.EnglishName,
      this.BirthDate,
      this.NationalId,
      this.SocialId,
      this.Email,
      this.Phone,
      this.Emergency_Number,
      this.AddressText,
      this.DistrictId,
      this.PoBox,
      this.ZipCode);
}
