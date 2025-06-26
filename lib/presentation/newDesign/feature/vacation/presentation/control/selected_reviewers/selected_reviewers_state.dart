import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:equatable/equatable.dart';

class SelectedReviewersState extends Equatable {
  final List<DefaultReviewerModel> selectedReviewers;

  const SelectedReviewersState({this.selectedReviewers = const []});

  SelectedReviewersState copyWith({
    List<DefaultReviewerModel>? selectedReviewers,
  }) {
    return SelectedReviewersState(
      selectedReviewers: selectedReviewers ?? this.selectedReviewers,
    );
  }

  @override
  List<Object?> get props => [selectedReviewers];
}
