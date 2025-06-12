import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:equatable/equatable.dart';

class CalculateVacationDurationState extends Equatable {
  final bool isLoading;
  final CalculateVacationDurationResponseModel? response;
  final String? errorMessage;

  const CalculateVacationDurationState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  CalculateVacationDurationState copyWith({
    bool? isLoading,
    CalculateVacationDurationResponseModel? response,
    String? errorMessage,
  }) {
    return CalculateVacationDurationState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, response, errorMessage];
}
