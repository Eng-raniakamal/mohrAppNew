import 'package:flutter_bloc/flutter_bloc.dart';

class SkillPageCubit extends Cubit<int> {
  SkillPageCubit() : super(0);

  void changePage(int page) {
    emit(page);
  }
}