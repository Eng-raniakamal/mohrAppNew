import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:equatable/equatable.dart';

class PostVacationState extends Equatable {
  final bool isLoading;
  final PostVacationResponseModel? response;
  final String? errorMessage;

   const PostVacationState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostVacationState copyWith({
    bool? isLoading,
    PostVacationResponseModel? response,
    String? errorMessage,
  }) {

    return PostVacationState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    response,
    errorMessage,
  ];
}
