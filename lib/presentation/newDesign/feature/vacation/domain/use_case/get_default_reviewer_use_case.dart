import 'package:dartz/dartz.dart';
import 'package:essmohr/presentation/newDesign/core/error/failure.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/repository/vacation_repository.dart';

class GetDefaultReviewerUseCase {
  VacationRepository vacationRepository;

  GetDefaultReviewerUseCase(this.vacationRepository);

  Future<Either<Failure, List<DefaultReviewerModel>>> call(
      {required RequestDefaultReviewerModel requestDefaultReviewerModel}
      ) async {
    return await vacationRepository.getDefaultReviewer(
      requestDefaultReviewerModel: requestDefaultReviewerModel
    );
  }


}
