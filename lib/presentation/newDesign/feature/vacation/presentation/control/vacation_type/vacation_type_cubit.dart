import 'package:essmohr/presentation/newDesign/feature/vacation/domain/entity/vacation_type_entity.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/file_picker/file_picker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_vacation_type_use_case.dart';
import 'vacation_type_state.dart';

class VacationTypeCubit extends Cubit<VacationTypeState> {
  final GetVacationTypeUseCase getVacationTypeUseCase;
  final FilePickerCubit filePickerCubit;

  List<VacationTypeEntity>? _cachedVacationTypes; // كاش داخلي

  VacationTypeCubit(this.getVacationTypeUseCase, this.filePickerCubit)
      : super(const VacationTypeState());

  Future<void> fetchVacationTypes() async {
    // لو فيه بيانات محفوظة مسبقًا، نستخدمها ونوقف التحميل
    if (_cachedVacationTypes != null) {
      emit(state.copyWith(
        vacationTypes: _cachedVacationTypes,
        selectedVacation: _cachedVacationTypes!.isNotEmpty
            ? _cachedVacationTypes!.first
            : null,
        isLoading: false,
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getVacationTypeUseCase();

    result.fold(
          (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "فشل في تحميل أنواع الإجازات",
        ));
      },
          (data) {
        _cachedVacationTypes = data; // نحفظ البيانات في الكاش

        emit(state.copyWith(
          isLoading: false,
          vacationTypes: data,
          selectedVacation: data.isNotEmpty ? data.first : null,
        ));
      },
    );
  }

  void selectVacation(VacationTypeEntity vacation) {
    emit(state.copyWith(selectedVacation: vacation));
    filePickerCubit.clearFile();

  }
}
