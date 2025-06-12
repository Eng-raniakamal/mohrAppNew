import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import '../../../data/model/check_handled_alerts/check_handled_alerts_request_model.dart';
import '../../../data/model/default_reviewer/default_reviewer_model.dart';
import '../../../data/model/post_vacation/post_vacation_request_model.dart';
import '../../../data/model/validate_vacation/validate_vacation_request_model.dart';
import '../../control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import '../../control/date_cubit/date_cubit.dart';
import '../../control/default_reviewer/default_reviewer_cubit.dart';
import '../../control/post_vacation/post_vacation_cubit.dart';
import '../../control/submit_vacation_request/submit_vacation_request_cubit.dart';
import '../../control/vacation_type/vacation_type_cubit.dart';
class VacationRequestHelper {
  static void submitVacationRequest(BuildContext context) {

    final dateCubit = context.read<DateCubit>().state;
    final vacationType = context.read<VacationTypeCubit>().state.selectedVacation!;
    final durationCount = context.read<CalculateVacationDurationCubit>().state.response?.count ?? 0;
    final reviewers = context.read<DefaultReviewerCubit>().state.reviewers;
    final note = context.read<PostVacationCubit>().noteInputController.text;

    final postVacationModel = PostVacationRequestModel(
      vacationTypeId: vacationType.id,
      fromDate: dateCubit.fromDate.toString(),
      toDate: dateCubit.toDate.toString(),
      duration: durationCount.toInt(),
      notes: note,
      request: RequestModel(
        reviewers: reviewers
            .map((e) => DefaultReviewerModel(employeeId: e.id, name: e.name,code: e.code))
            .toList(),
      ),
    );

    final checkHandledAlertsRequestModel = CheckHandledAlertsRequestModel(
      vacationTypeId: vacationType.id??0,
      fromDate: dateCubit.fromDate.toString(),
      toDate: dateCubit.toDate.toString(),
      duration: durationCount.toInt(),
    );

    final validateVacationRequestModel = ValidateVacationRequestModel(
      vacationTypeId: vacationType.id??0,
      fromDate: dateCubit.fromDate,
      toDate: dateCubit.toDate,
      duration: durationCount.toDouble(),
      id: 0,
    );

    final calculateVacationDurationRequestModel = CalculateVacationDurationRequestModel(
      vacationTypeId: vacationType.id??0,
      fromDate: dateCubit.fromDate,
      toDate: dateCubit.toDate,
      unit: 1,
    );

    context.read<SubmitVacationRequestCubit>().submit(
      postVacationModel: postVacationModel,
      checkHandledAlertsRequestModel: checkHandledAlertsRequestModel,
      validateVacationRequestModel: validateVacationRequestModel,
      calculateVacationDurationRequestModel: calculateVacationDurationRequestModel,
    );
  }
}
