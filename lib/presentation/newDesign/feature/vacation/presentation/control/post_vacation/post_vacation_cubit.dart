import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/export_file/package_export.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/post_vacation/post_vacation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostVacationCubit extends Cubit<PostVacationState> {
  final PostVacationUseCase postVacationUseCase;

  PostVacationCubit(this.postVacationUseCase)
      : super(PostVacationState()); // سيحسب start/end/duration تلقائيًا



  final TextEditingController noteInputController = TextEditingController();
  final TextEditingController employSecondController = TextEditingController();

  Future<void> postVacation({required PostVacationRequestModel postVacationModel}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));


    final result = await postVacationUseCase(postVacationModel: postVacationModel);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
