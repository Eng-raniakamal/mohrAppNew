import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';
import '../../data/model/get_vacation_requests/get_vacation_requests_response_model.dart';



class GetVacationRequestsUseCase {
  VacationRepository vacationRepository;

  GetVacationRequestsUseCase(this.vacationRepository);

  Future<Either<Failure, List<GetVacationRequestsResponseModel>>> call() async {
    return await vacationRepository.getVacationRequests();
  }


}
