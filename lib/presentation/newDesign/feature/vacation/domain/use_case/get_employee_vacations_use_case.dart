import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

import '../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class GetEmployeeVacationsUseCase {
  final VacationRepository vacationRepository;

  GetEmployeeVacationsUseCase(this.vacationRepository);

  Future<Either<Failure, List<GetEmployeeVacationsResponseModel>>> call() async {
    return await vacationRepository.getEmployeeVacations();
  }
}
