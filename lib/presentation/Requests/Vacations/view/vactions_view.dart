import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/login/singinScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mohr_hr/presentation/login/loginView.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/login/loginView.dart';

import '../viewModel/vacationViewModel.dart';


class vacationsView extends StatefulWidget {
  const vacationsView({Key? key}) : super(key: key);

  @override
  State<vacationsView> createState() => _vacationsViewState();
}


class _vacationsViewState extends State<vacationsView> {

 final VacationViewModel _viewModel = instance <VacationViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: SingleChildScrollView(
          child: StreamBuilder<FlowState>(
              stream: _viewModel.outputState,
              builder: (context, snapshot) {
                return
                  snapshot.data?.getScreenWidget(
                      context, _getContentWidget(),
                          () {
                        _viewModel.start();
                      }) ??
                      _getContentWidget();
                      //Container();
              }),
        ));
  }

  Widget _getContentWidget() {
    return StreamBuilder<VacationViewObject>(
        stream: _viewModel.outputVacations,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getVacation(snapshot.data?.vacations),
                      ],
          );
        });
  }


  Widget _getVacation(List<Vacation>? vacations) {
    if (vacations != null) {
      return Column(mainAxisAlignment:MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Padding(padding: EdgeInsets.fromLTRB(5.0,30,5,20),
                child:SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text("VacationType ")),
                        DataColumn(label: Text("Current")),
                        DataColumn(label: Text("Transferred")),
                        DataColumn(label: Text("Total ")),
                        DataColumn(label: Text("Consumed ")),
                        //DataColumn(label: Text(" Available balance")),
                        DataColumn(label: Text("Pending")),
                      ],
                      rows: vacations
                          .map((vacation) =>
                          DataRow(cells: [
                            DataCell(Text(vacation.vacationTypeName)),
                            DataCell(Text((vacation.vacationTypeDuration).toString())),
                            DataCell(Text((vacation.transferred).toString())),
                            DataCell(Text((vacation.total).toString())),
                            DataCell(Text((vacation.consumed).toString())),
                            DataCell(Text((vacation.pending).toString())),
                          ]))
                          .toList()
                  ),
                )
            ),
          ),
        ],
      );

    }
    return Padding(padding: const EdgeInsets.all(25.0),
    child: Container());
  }
}

DataTable _createVacationTable(List<Vacation> vacation) {
  return DataTable(
    columns: _createColumns(),
    rows: _createRows(vacation),
  );
}
List<DataColumn> _createColumns() {
  return [
      DataColumn(label: Text("Vacation Type ")),
      DataColumn(label: Text("Current year balance")),
      DataColumn(label: Text("Transferred balance")),
      DataColumn(label: Text("Total balance")),
      DataColumn(label: Text("Consumed balance")),
      DataColumn(label: Text("Pending"))
        ];

}
List<DataRow> _createRows(List<Vacation> vacations) {

    return vacations
        .map((vacation) =>
        DataRow(cells: [
          DataCell(Text(vacation.vacationTypeName)),
          DataCell(Text((vacation.vacationTypeDuration).toString())),
          DataCell(Text((vacation.transferred).toString())),
          DataCell(Text((vacation.total).toString())),
          DataCell(Text((vacation.consumed).toString())),
          DataCell(Text((vacation.pending).toString()))
        ]))
        .toList();


}
