import 'package:flutter_bloc/flutter_bloc.dart';

class DayTabSwitcherCubit extends Cubit<int> {
  DayTabSwitcherCubit() : super(0);

  changeTab(int index){
    emit(index);
  }

}