import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/selected_reviewers/selected_reviewers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SelectedReviewersCubit extends Cubit<SelectedReviewersState> {
  SelectedReviewersCubit() : super(const SelectedReviewersState());

  void addReviewer(DefaultReviewerModel reviewer) {
    if (!state.selectedReviewers.any((r) => r.id == reviewer.id)) {
      final updatedList = List<DefaultReviewerModel>.from(state.selectedReviewers)
        ..add(reviewer);
      emit(state.copyWith(selectedReviewers: updatedList));
    }
  }

  void removeReviewer(DefaultReviewerModel reviewer) {
    final updatedList = state.selectedReviewers
        .where((r) => r.id != reviewer.id)
        .toList();
    emit(state.copyWith(selectedReviewers: updatedList));
  }

  void clearAll() {
    emit(state.copyWith(selectedReviewers: []));
  }
}
