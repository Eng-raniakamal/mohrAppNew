
// ignore_for_file: camel_case_types

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:flutter/material.dart';

import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/Requests/Salary/View/salaryDetailsDialog.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/resources/colors.dart';

import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';

import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import '../../../../application/constants.dart';
import '../../../newDesign/feature/salary/widget/salary_widget.dart';
import '../../../newDesign/feature/salary/widget/title_widget.dart';
import '../ViewModel/salaryViewModel.dart';


class salaryView extends StatefulWidget {
  const salaryView({Key? key}) : super(key: key);

  @override
  State<salaryView> createState() => _salaryViewState();
}
// final items=<Widget>
// [ const Icon(Icons.person,size: 30,),
//   const Icon(Icons.home,size: 30,),
//   const Icon(Icons.notifications,size: 30,),
//
// ];
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
        child: Builder(
        builder: (context) =>
        Scaffold(
            //appBar: buildAppBar(context),
           // bottomNavigationBar:NavigatorBar(index: 0,notificationNumber: Constants.notificationNumber,),
            appBar: AppBar(
              backgroundColor: Color(0xffEDF9FF),
                title: SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Container(

                      //color: Color(0xffEDF9FF),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24).r,
                      child:
                        Text(AppStrings.Salary.tr(), style: AppTextStyle.iBMP24w600),
                        )],
                    ),),),
            body:
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(

                  children: [
       // child: SingleChildScrollView(
       StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.start();
                },
                    () {
                }) ??
                _getContentWidget();
            //Container();
          }),
                  ] ),
            ))));
  }

  Widget _getContentWidget() {
    return
      StreamBuilder<SalaryViewObject>(
        stream: _viewModel.outputSalarys,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 50)),
                      Container(child: _getSalary(snapshot.data?.salary)),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _getSalary(List<SalaryItems>? salary) {
    if (salary != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         // SingleChildScrollView(
         //   scrollDirection: Axis.horizontal,
         //    child: Padding(
         //        padding: EdgeInsets.fromLTRB(20, 30, 30, 30),
         //
         //      child: SingleChildScrollView(
         //       child: Column(
         //         children: [
         //       TitleWidget(title: AppStrings.Salary.tr()),
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Column(
                      children: List.generate(
                        salary.length,
                            (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0).r,
                          child: SalaryWidget(salaryModel: salary[index],),
                        ),
                      ),
                    ),
                  ),

                ],
              );
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Container(
                //     width: 400,
                //     child: DataTable(
                //         headingRowColor: WidgetStateColor.resolveWith(
                //             (states) => colorManager.primary),
                //         columns:  [
                //           DataColumn(
                //               label: Text(
                //             AppStrings.Month.tr(),
                //             style: TextStyle(color: colorManager.white),
                //           )),
                //           DataColumn(
                //               label: Text(AppStrings.Salary.tr(),
                //                   style: TextStyle(color: colorManager.white))),
                //           DataColumn(
                //               label: Text("",
                //                   style: TextStyle(color: colorManager.white))),
                //         ],
                //         rows: salary
                //             .map((salary) => DataRow(cells: [
                //                   DataCell(
                //                       Text(getDate((salary.Month).toString()))),
                //                   DataCell(Text((salary.Value).toString())),
                //                   DataCell(GestureDetector(
                //                     onTap: () {
                //                       int id = salary.id;
                //                       // String url= Constants.salaryDetailsUrl;
                //                       // url=url+id.toString();
                //                       if (id == 0) {
                //                         displayDialoge(context);
                //                       } else {
                //                         Constants.salaryDetailsId =
                //                             id.toString();
                //                         initSalaryDetailsModule();
                //                         showCustomDialog(context, onValue: (_) {
                //                           setState(() {
                //
                //                           });
                //                         });
                //                         // Navigator.of(context)
                //                         //     .pushReplacementNamed(
                //                         //     Routes.salaryDetails);
                //                         //displayDialoge();
                //
                //                       }
                //                       //else
                //                       //   {displayDialoge();}
                //                     },
                //                     child:  Text(
                //                       AppStrings.More_Details.tr(),
                //                       style: TextStyle(
                //                           decoration: TextDecoration.underline,
                //                           color: Colors.blue),
                //                       overflow: TextOverflow.ellipsis,
                //                     ),
                //                   ))
                //                 ]))
                //             .toList()),
                //   ),
                // )),
    //       ),
    //      // )
    // )],
    //   );
    }
    return Padding(padding: const EdgeInsets.all(25.0), child: Container());
  }

  // Widget _getImageWidget() {
  //   return ProfileWidget(imagePath: Constants.imagePath, onClicked: () {});
  // }

  void displayDialoge(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: AppStrings.alerts.tr(),
      desc: AppStrings.no_salary_found.tr(),
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
  }


}


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


