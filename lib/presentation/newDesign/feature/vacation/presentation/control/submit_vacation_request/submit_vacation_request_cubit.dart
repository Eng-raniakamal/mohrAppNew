import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/check_handled_alerts/check_handled_alerts_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/post_vacation/post_vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/submit_vacation_request/submit_vacation_request_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/validate_vacation/validate_vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/validate_vacation/validate_vacation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitVacationRequestCubit extends Cubit<SubmitVacationRequestState> {
  final CalculateVacationDurationCubit calculateVacationDurationCubit;
  final ValidateVacationCubit validateCubit;
  final CheckHandledAlertsCubit alertsCubit;
  final PostVacationCubit postVacationCubit;

  SubmitVacationRequestCubit({  required this.calculateVacationDurationCubit, required this.validateCubit, required this.alertsCubit, required this.postVacationCubit,}) : super(SubmitInitial());

  Future<void> submit({required CalculateVacationDurationRequestModel calculateVacationDurationRequestModel, required ValidateVacationRequestModel validateVacationRequestModel, required CheckHandledAlertsRequestModel checkHandledAlertsRequestModel, required PostVacationRequestModel postVacationModel,}) async {
    try {
      emit(SubmitLoading());
//---------------------------------------------------------
      // 1. حساب المدة
      await calculateVacationDurationCubit.calculateDuration(calculateVacationDurationRequestModel: calculateVacationDurationRequestModel,);
      final durationState = calculateVacationDurationCubit.state;
      if (durationState.response?.isValid != true) {
        emit(
          SubmitError(
            "المدة ${durationState.response?.message ?? 'خطأ في حساب المدة'}",
          ),
        );
        return;
      }
      emit(SubmitDurationCalculated());
//----------------------------------------------------------
      // 2. التحقق من الطلب
      await validateCubit.validate(validateVacationRequestModel: validateVacationRequestModel);
      final validateState = validateCubit.state;
      if (validateState is! ValidateVacationSucceed || validateState.response.isValid == false) {
        emit(SubmitError("التحقق ${validateState is ValidateVacationSucceed ? validateState.response.message?.tr() ?? 'خطأ في التحقق' : 'خطأ في التحقق'}",),);
        return;
      }
      emit(SubmitValidationSucceeded());
//-----------------------------------------------------------
      // 3. التحقق من التنبيهات
      await alertsCubit.checkAlerts(checkHandledAlertsRequestModel: checkHandledAlertsRequestModel);
      final alertsState = alertsCubit.state;
      if (alertsState.response?.count != 0) {
        emit(
          SubmitError(
            "التنبيهات ${alertsState.response?.message ?? 'خطأ في التنبيهات'}",
          ),
        );
        return;
      }
      emit(SubmitAlertsChecked());
//-----------------------------------------------------------
      // 4. إرسال طلب الإجازة
      await postVacationCubit.postVacation(postVacationModel: postVacationModel );
      final postState = postVacationCubit.state;
      if (postState.errorMessage != null) {
        final postState = postVacationCubit.state;
        emit(SubmitError(postState.errorMessage!));
        return;
      }

      // إذا نجح الإرسال
      emit(SubmitSuccess()); // أنشئ حالة جديدة SubmitSuccess (يمكنك تعريفها)
    } catch (e) {
      emit(SubmitError(e.toString()));
    }
  }
}
