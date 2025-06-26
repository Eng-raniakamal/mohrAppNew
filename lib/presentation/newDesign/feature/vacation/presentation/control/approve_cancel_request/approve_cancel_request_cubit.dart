import 'package:essmohr/presentation/newDesign/feature/vacation/domain/use_case/approve_cancel_request_use_case.dart';

import '../../../data/model/approve_cancel/approve_cancel_request_model.dart';
import 'approve_cancel_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproveCancelRequestCubit extends Cubit<ApproveCancelRequestState> {

  final ApproveCancelRequestUseCase approveCancelRequestUseCase;
  ApproveCancelRequestCubit({required this.approveCancelRequestUseCase})
    : super(ApproveCancelRequestState());

  Future<void> approveCancelRequest(ApproveCancelRequestModel approveCancelRequestModel,) async {

    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: null));

    final result = await approveCancelRequestUseCase(approveCancelRequestModel: approveCancelRequestModel);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (response) {
        emit(state.copyWith(isLoading: false, isSuccess: response));
      },
    );
  }
}
