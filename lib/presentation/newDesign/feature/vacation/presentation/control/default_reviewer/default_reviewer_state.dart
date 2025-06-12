import 'package:equatable/equatable.dart';
import '../../../data/model/default_reviewer/default_reviewer_model.dart';

class DefaultReviewerState extends Equatable {
  final List<DefaultReviewerModel> reviewers;
  final DefaultReviewerModel? selectedReviewer;
  final bool isLoading;
  final String? errorMessage;

  const DefaultReviewerState({
    this.reviewers = const [],
    this.selectedReviewer,
    this.isLoading = false,
    this.errorMessage,
  });

  DefaultReviewerState copyWith({
    List<DefaultReviewerModel>? reviewers,
    DefaultReviewerModel? selectedReviewer,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DefaultReviewerState(
      reviewers: reviewers ?? this.reviewers,
      selectedReviewer: selectedReviewer ?? this.selectedReviewer,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [reviewers, selectedReviewer, isLoading, errorMessage];
}
