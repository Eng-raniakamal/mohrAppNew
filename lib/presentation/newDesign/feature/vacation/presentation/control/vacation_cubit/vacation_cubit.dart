import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import '../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class VacationCubit extends Cubit<int> {
  VacationCubit() : super(0);
  late GetEmployeeVacationsResponseModel _getEmployeeVacationsModel;

  changeTab(int index) {
    emit(index);
  }

  setEmployeeVacationsModel(GetEmployeeVacationsResponseModel model){
    _getEmployeeVacationsModel = model;
  }

  getEmployeeVacationsModel(){
    return _getEmployeeVacationsModel;
  }

}

