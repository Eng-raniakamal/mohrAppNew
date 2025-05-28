import 'package:flutter_bloc/flutter_bloc.dart';

class EducationPageCubit extends Cubit<int> {
  EducationPageCubit() : super(0);

  changePage(int newPage) {
    emit(newPage);
  }
}
