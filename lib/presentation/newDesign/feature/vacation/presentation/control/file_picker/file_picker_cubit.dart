import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/file_picker/file_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';


class FilePickerCubit extends Cubit<FilePickerState> {
  FilePickerCubit() : super(FilePickerInitial());

  void pickImageFile() async {
    emit(FilePickerLoading());

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image, // ✅ صور فقط
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        emit(FilePickerSuccess(result.files.first));
      } else {
        emit(FilePickerCancelled());
      }
    } catch (e) {
      emit(FilePickerError("حدث خطأ أثناء اختيار الصورة: $e"));
    }
  }

  void clearFile() {
    emit(FilePickerInitial());
  }
}
