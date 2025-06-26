import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/get_default_reviewer_use_case.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultReviewerCubit extends Cubit<DefaultReviewerState> {
  final GetDefaultReviewerUseCase getDefaultReviewerUseCase;

  DefaultReviewerCubit(this.getDefaultReviewerUseCase)
      : super(const DefaultReviewerState());

  Future<void> fetchDefaultReviewers() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    RequestDefaultReviewerModel requestDefaultReviewerModel = RequestDefaultReviewerModel(
      requestType: "1",
      date: '2025-05-12',
      requestedTypeId: "",
    );

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

  void addReviewer(DefaultReviewerModel reviewer) {
    if (!state.listSelectedReviewers.any((r) => r.id == reviewer.id)) {
      final updated = [...state.listSelectedReviewers, reviewer];
      emit(state.copyWith(listSelectedReviewers: updated));
    }
  }

  void removeReviewer(DefaultReviewerModel reviewer) {
    final updated = state.listSelectedReviewers
        .where((r) => r.id != reviewer.id)
        .toList();
    emit(state.copyWith(listSelectedReviewers: updated));
  }

  void clearReviewers() {
    emit(state.copyWith(listSelectedReviewers: []));
  }

  void clearState() {
    emit(const DefaultReviewerState());
  }
}
