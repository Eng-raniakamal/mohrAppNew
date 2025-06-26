
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';

import '../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class GetEmployeeVacationsState{
  bool ?isLoading= false;
  String? errorMessage;
  List<GetEmployeeVacationsResponseModel>? response;

  GetEmployeeVacationsState({this.isLoading, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetEmployeeVacationsResponseModel>? response,
  }) {
    return GetEmployeeVacationsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }

}