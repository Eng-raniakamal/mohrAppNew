import 'package:flutter_bloc/flutter_bloc.dart';

class VacationTabCubit extends Cubit<int>{
  VacationTabCubit() : super(0);

  changeTab(int index) {
    emit(index);
  }
}