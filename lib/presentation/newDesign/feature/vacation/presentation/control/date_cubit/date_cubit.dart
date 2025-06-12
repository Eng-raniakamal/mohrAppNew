import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      :super(DateState(fromDate: DateTime.now(), toDate: DateTime.now()));


  void updateFromDate(DateTime date) {
    emit(state.copyWith(fromDate: date));
  }

  void updateToDate(DateTime date) {
    emit(state.copyWith(toDate: date));
  }


}
