import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/entity/vacation_type_entity.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class GetVacationTypeUseCase {
  VacationRepository vacationRepository;

  GetVacationTypeUseCase(this.vacationRepository);

  Future<Either<Failure, List<VacationTypeModel>>> call() async {
    return await vacationRepository.getVacationType();
  }


}
