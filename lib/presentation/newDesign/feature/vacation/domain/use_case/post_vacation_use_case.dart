import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class PostVacationUseCase  {
  VacationRepository vacationRepository;
  PostVacationUseCase(this.vacationRepository);


  Future<Either<Failure, PostVacationResponseModel>> call({required PostVacationRequestModel postVacationModel}){
    return vacationRepository.postVacation(postVacationModel: postVacationModel);
  }

}
