import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabSwitcherCubit extends Cubit<int> {
  TabSwitcherCubit() : super(0);
 late ReportModel _reportModel;

  changeTab(int index){
    emit(index);
  }
  setReportModel(ReportModel model){
    _reportModel = model;
  }
  getReportModel(){
    return _reportModel;
  }
}