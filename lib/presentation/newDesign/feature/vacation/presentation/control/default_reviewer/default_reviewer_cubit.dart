import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_default_reviewer_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultReviewerCubit extends Cubit<DefaultReviewerState> {
  final GetDefaultReviewerUseCase getDefaultReviewerUseCase;

  DefaultReviewerCubit(this.getDefaultReviewerUseCase)
      : super(const DefaultReviewerState());

  Future<void> fetchDefaultReviewers({
    required RequestDefaultReviewerModel requestDefaultReviewerModel,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getDefaultReviewerUseCase(
      requestDefaultReviewerModel: requestDefaultReviewerModel,
    );

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: "فشل في تحميل المراجعين",
          ),
        );
      },
          (data) {
        emit(
          state.copyWith(
            isLoading: false,
            reviewers: data,
            selectedReviewer: data.isNotEmpty ? data.first : null,
          ),
        );
      },
    );
  }

  void selectReviewer(DefaultReviewerModel reviewer) {
    emit(state.copyWith(selectedReviewer: reviewer));
  }
}
