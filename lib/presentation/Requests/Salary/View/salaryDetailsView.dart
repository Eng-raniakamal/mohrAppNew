// ignore_for_file: camel_case_types

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';

import '../ViewModel/salaryDetailsViewModel.dart';




class salaryDetailsView extends StatefulWidget {
  const salaryDetailsView({Key? key}) : super(key: key);

  @override
  State<salaryDetailsView> createState() => _salaryDetailsViewState();
}


class _salaryDetailsViewState extends State<salaryDetailsView> {

  final SalaryDetailsViewModel _viewModel = instance <SalaryDetailsViewModel>();


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
    return
            StreamBuilder<FlowState>(
                stream: _viewModel.outputState,
                builder: (context, snapshot) {
                  return
                    snapshot.data?.getScreenWidget(
                        context,
                        _getContentWidget(),
                        () {
                          _viewModel.start();
                        },
                        () {
                        }
                    ) ??
                        _getContentWidget();
                }
         );
  }

  Widget _getContentWidget() {
    return
       StreamBuilder<SalaryDetails>(
          stream: _viewModel.outputSalarys,
          builder: (context, snapshot) {
            return
              Container(
                color: Colors.white70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 0)),
                      Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Text("Show Salaries",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                Row(
                                    children: [
                                      _getBenefitList(
                                          snapshot.data?.benefitItems),
                                    ]),

                                Row(
                                    children: [
                                      _getTotalBenefit(
                                          snapshot.data?.totalBenefits),

                                    ]),
                                Row(
                                    children: [
                                      _getDeductedList(
                                          snapshot.data?.deductedItems),
                                    ]),
                                Row(
                                    children: [
                                      _getTotalDeductions(
                                          snapshot.data?.totalDeductions)
                                    ]),
                                SizedBox(height: 20),
                                Padding(
                                  padding:EdgeInsets.only(left:0),
                                  child: Row(
                                      children: [
                                         _getTotal(
                                              snapshot.data?.NetSalary),

                                      ]),
                                ),


                              ],
                            ),
                          ]),
                      // Container(
                      //    // child: _getSalaryDetails()
                      // ),
                    ],

                ),
              );
          });
  }

  Widget _getBenefitList(List<Benefit>? benifit) {
    if (benifit != null) {
      return Padding(
          padding: EdgeInsets.only(
              left: 0, right:0, top: 12),

          child: Column(
            children: [
              DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => colorManager.primary),
                columns: [
                  DataColumn(label: Text(AppStrings.Benefits.tr())),
                  DataColumn(label: Text(""))],

                rows: benifit
                    .map((benifit) =>
                    DataRow(cells: [
                      DataCell(Text(benifit.ItemName.toString())),
                      DataCell(Text(benifit.value.toString())),
                    ])).toList(),

              ),

            ],
          )
      );
    } else {
      return Container();
    }
  }

  Widget _getDeductedList(List<Deducted>? deducted) {
    if (deducted != null) {
      return
        Padding(
          padding: EdgeInsets.only(
              left: 0, right: 0, top: 12),

          child: Column(
            children: [
              DataTable( headingRowColor: MaterialStateColor.resolveWith((states) => colorManager.primary),
                columns: [
                  DataColumn(label: Text(AppStrings.Deducted.tr())),
                  DataColumn(label: Text(""))],

                rows: deducted
                    .map((deduct) =>
                    DataRow(cells: [
                      DataCell(Text(deduct.ItemName.toString())),
                      DataCell(Text(deduct.value.toString())),
                    ])).toList(),

              ),

            ],
          )
      );
    } else {
      return Container();
    }
  }

  Widget _getTotalDeductions(double? totaldeducated) {
    if (totaldeducated != null) {
      String total = totaldeducated.toString();
      return
        Text((AppStrings.Total_of_Benefit.tr())+" : " + total,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    } else {
      return Text((AppStrings.Total_of_Benefit.tr())+" : 0.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    }
  }

  Widget _getTotalBenefit(double? totalBenefit) {
    if (totalBenefit != null) {
      String total = totalBenefit.toString();
      return
        Text((AppStrings.Total_of_Benefit.tr())+" : "  + total,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    } else {
      return Text((AppStrings.Total_of_Benefit.tr())+" : 0.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    }
  }

  Widget _getTotal(double? total) {
    if (total != null) {
      String netSalary = total.toString();
      return
        Text((AppStrings.Net_Salary.tr())+" : "  + netSalary,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    } else {
      return Text((AppStrings.Net_Salary.tr())+" : 0.0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17));
    }
  }


}
