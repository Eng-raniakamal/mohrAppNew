
import 'package:file_picker/file_picker.dart';

abstract class FilePickerState {}

class FilePickerInitial extends FilePickerState {}

class FilePickerLoading extends FilePickerState {}

class FilePickerSuccess extends FilePickerState {
  final PlatformFile file;
  FilePickerSuccess(this.file);
}

class FilePickerCancelled extends FilePickerState {}

class FilePickerError extends FilePickerState {
  final String message;
  FilePickerError(this.message);
}
