import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/validate_vacation.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/validate_vacation/validate_vacation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../date_cubit/date_cubit.dart';
import '../vacation_type/vacation_type_cubit.dart';

class ValidateVacationCubit extends Cubit<ValidateVacationState> {
  final ValidateVacationUseCase validateVacationUseCase;

  ValidateVacationCubit(this.validateVacationUseCase ) : super(ValidateVacationInitial());



  Future<void> validate(
      {required ValidateVacationRequestModel validateVacationRequestModel}) async {
    emit(ValidateVacationLoading());






    final result = await validateVacationUseCase(validateVacationRequestModel);
    result.fold(
          (failure) => emit(ValidateVacationError(failure.message)),
          (data) => emit(ValidateVacationSucceed(data)),
    );
  }


}
