import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_response_model.dart';

abstract class ValidateVacationState {}

class ValidateVacationInitial extends ValidateVacationState {}

class ValidateVacationLoading extends ValidateVacationState {}

class ValidateVacationSucceed extends ValidateVacationState {
  final ValidateVacationResponseModel response;

  ValidateVacationSucceed(this.response);
}

class ValidateVacationError extends ValidateVacationState {
  final String message;

  ValidateVacationError(this.message);
}
