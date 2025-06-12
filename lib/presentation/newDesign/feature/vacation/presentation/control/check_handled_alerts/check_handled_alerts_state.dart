import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_response_model.dart';
import 'package:equatable/equatable.dart';

class CheckHandledAlertsState extends Equatable {
  final bool isLoading;
  final CheckHandledAlertsResponseModel? response;
  final String? errorMessage;

  const CheckHandledAlertsState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  });

  CheckHandledAlertsState copyWith({
    bool? isLoading,
    CheckHandledAlertsResponseModel? response,
    String? errorMessage,
  }) {
    return CheckHandledAlertsState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, response, errorMessage];
}
