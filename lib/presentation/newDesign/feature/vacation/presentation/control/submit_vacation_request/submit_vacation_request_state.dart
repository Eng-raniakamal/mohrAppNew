abstract class SubmitVacationRequestState {}

class SubmitInitial extends SubmitVacationRequestState {}

class SubmitLoading extends SubmitVacationRequestState {}

class SubmitDurationCalculated extends SubmitVacationRequestState {}

class SubmitValidationSucceeded extends SubmitVacationRequestState {}

class SubmitAlertsChecked extends SubmitVacationRequestState {}

class SubmitError extends SubmitVacationRequestState {
  final String message;
  SubmitError(this.message);
}
class SubmitSuccess extends SubmitVacationRequestState {}
