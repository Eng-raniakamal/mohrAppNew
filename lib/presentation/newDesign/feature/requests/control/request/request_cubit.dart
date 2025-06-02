import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCubit extends Cubit<int> {
  RequestCubit() : super(0);


  void changePage(int item) {
    emit(item);
  }
}