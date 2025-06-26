import 'package:equatable/equatable.dart';
import '../../../data/model/default_reviewer/default_reviewer_model.dart';

class DefaultReviewerState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<DefaultReviewerModel> reviewers;
  final DefaultReviewerModel? selectedReviewer;
  final List<DefaultReviewerModel> listSelectedReviewers;

  const DefaultReviewerState({
    this.isLoading = false,
    this.errorMessage,
    this.reviewers = const [],
    this.selectedReviewer,
    this.listSelectedReviewers = const [],
  });

  DefaultReviewerState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<DefaultReviewerModel>? reviewers,
    DefaultReviewerModel? selectedReviewer,
    List<DefaultReviewerModel>? listSelectedReviewers,
  }) {
    return DefaultReviewerState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      reviewers: reviewers ?? this.reviewers,
      selectedReviewer: selectedReviewer ?? this.selectedReviewer,
      listSelectedReviewers: listSelectedReviewers ?? this.listSelectedReviewers,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    reviewers,
    selectedReviewer,
    listSelectedReviewers,
  ];
}
