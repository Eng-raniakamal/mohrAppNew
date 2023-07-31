// ignore_for_file: camel_case_types

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/Requests/Salary/View/salaryDetailsDialog.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/widgets/profile_widget.dart';
import '../../../../application/constants.dart';
import '../ViewModel/salaryViewModel.dart';

// ignore: camel_case_types
class salaryView extends StatefulWidget {
  const salaryView({Key? key}) : super(key: key);

  @override
  State<salaryView> createState() => _salaryViewState();
}

class _salaryViewState extends State<salaryView> {
  final SalaryViewModel _viewModel = instance<SalaryViewModel>();

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
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.start();
                }) ??
                _getContentWidget();
            //Container();
          }),
    ));
  }

  Widget _getContentWidget() {
    return StreamBuilder<SalaryViewObject>(
        stream: _viewModel.outputSalarys,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 50)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Column(
                        children: [
                          _getImageWidget(),
                        ],
                      ),
                    ]),
                    Container(child: _getSalary(snapshot.data?.salary)),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget _getSalary(List<SalaryItems>? salary) {
    if (salary != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 400,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => colorManager.primary),
                        columns: const [
                          DataColumn(
                              label: Text(
                            "Month ",
                            style: TextStyle(color: colorManager.white),
                          )),
                          DataColumn(
                              label: Text("Salary",
                                  style: TextStyle(color: colorManager.white))),
                          DataColumn(
                              label: Text("",
                                  style: TextStyle(color: colorManager.white))),
                        ],
                        rows: salary
                            .map((salary) => DataRow(cells: [
                                  DataCell(
                                      Text(getDate((salary.Month).toString()))),
                                  DataCell(Text((salary.Value).toString())),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      int id = salary.id;
                                      // String url= Constants.salaryDetailsUrl;
                                      // url=url+id.toString();
                                      if (id == 0) {
                                        displayDialoge();
                                      } else {
                                        Constants.salaryDetailsId =
                                            id.toString();
                                        initSalaryDetailsModule();
                                        showCustomDialog(context, onValue: (_) {
                                          setState(() {

                                          });
                                        });
                                        // Navigator.of(context)
                                        //     .pushReplacementNamed(
                                        //     Routes.salaryDetails);
                                        //displayDialoge();

                                      }
                                      //else
                                      //   {displayDialoge();}
                                    },
                                    child: const Text(
                                      "More Details",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                                ]))
                            .toList()),
                  ),
                )),
          ),
        ],
      );
    }
    return Padding(padding: const EdgeInsets.all(25.0), child: Container());
  }

  Widget _getImageWidget() {
    return ProfileWidget(imagePath: Constants.imagePath, onClicked: () {});
  }

  Widget? displayDialoge() {
    showAnimatedDialog(
      context: context,

      // builder: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Information',
          contentText: 'no salary found ',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fade, curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
  }
}
// DataTable _createSalaryTable(List<SalaryItems> salary) {
//   return DataTable(
//     columns: _createColumns(),
//     rows: _createRows(salary),
//   );
// }
// List<DataColumn> _createColumns() {
//   return [
//     const DataColumn(label: Text("Month ")),
//     const DataColumn(label: Text("Salary Value")),
//
//   ];
//
// }
// List<DataRow> _createRows(List<SalaryItems> salary) {
//   return salary
//       .map((salary) =>
//       DataRow(cells: [
//         DataCell(Text((salary.Month).toString())),
//         DataCell(Text((salary.Value).toString())),
//       ]))
//       .toList();
// }

String? getMonthName(String? date) {
  String? month;
  // String? partOfDate= getString(date!);
  switch (date) {
    case '1 ':
      return month = "January";

    case '2 ':
      return month = "February";

    case '3 ':
      return month = "March";

    case '4 ':
      return month = "April";

    case '5 ':
      return month = "May";

    case '6 ':
      return month = "June";

    case '7 ':
      return month = "July";

    case '8 ':
      return month = "August";

    case '9 ':
      return month = "September";

    case '10 ':
      return month = "October";

    case '11 ':
      return month = "November";

    case '12 ':
      return month = "December";
  }
  return month;
}

String getDate(String date) {
  var searchString = '-';
  var index = date.indexOf(searchString, 0);
  var partOfDate = date.substring(0, index);
  var restofDate = date.substring(index, date.length);
  String? month = getMonthName(partOfDate);
  String Date = "${month!} $restofDate";
  return Date;
}
