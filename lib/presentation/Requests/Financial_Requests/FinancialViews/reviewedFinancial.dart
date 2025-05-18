import 'dart:convert';
import 'dart:core';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/navigationManu.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:http/http.dart' as http;

class ReviewedFinancial extends StatefulWidget implements NavigationStates
{
  const ReviewedFinancial ({Key? key}) : super(key: key);
  @override
  State<ReviewedFinancial> createState() => _ReviewedFinancialViewState();
}

class _ReviewedFinancialViewState extends State<ReviewedFinancial>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ReviewedFinancialModel>? FinancialsData;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                // appBar: buildAppBarstart(context),
                // backgroundColor: colorManager.white,
                body:
                SingleChildScrollView(
                  child: Column(
                      children: [
                        Form(
                          child: Container(
                              padding: const EdgeInsets.only(
                                //top: 12,
                                  left: 28,
                                  right: 28),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start
                                  , children: [
                                const SizedBox(height: 30),
                                FinancialTable()

                              ]
                              )
                          ),
                        )

                      ]),
                ),
              ),
        ),
      );
  }

  Widget FinancialTable(){
    return
      FutureBuilder(
          future:getReviewedFinancialRequests(),
          builder:(context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                        child: _createFinancialsTable(FinancialsData!)
                    ),
                  );
            }
          });
  }

  Widget _createFinancialsTable(List<ReviewedFinancialModel> Financial) {
    if(Financial.isEmpty==false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(Financial),

      );
    }else
    {return const Text("No Data Found");}
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.employee.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.empCode.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.date.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.empDepartment.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.jobTitle.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.from.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.to.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.period.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.Reviewers.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.attachments.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.notes.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.decision.tr(), style: TextStyle(color: colorManager.white),)),

    ];
  }

  List<DataRow> _createRows(List<ReviewedFinancialModel> financial) {

    return financial
        .map((financial) =>
        DataRow(cells: [

          DataCell(Text((financial.empName).toString())),
          DataCell(Text((financial.empCode).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(financial.date
          !)!).toString()),
          ])),
          DataCell(Text((financial.empDepartment).toString())),
          DataCell(Text((financial.jobTitle).toString())),

          DataCell(Text((financial.value).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: ReviewersList(financial.reviewers))),
          DataCell(Text((financial.attachments).toString())),
          DataCell(Text((financial.notes).toString())),
          DataCell(Text((financial.status).toString())),
        ]))
        .toList();
  }
  List<Widget> ReviewersList(List<dynamic> items) {
    return items.map((item) {
      final value = item["Name"] ?? '';
      return
        Text((value).toString());
    }).toList();

  }
  Future <List<ReviewedFinancialModel>?> getReviewedFinancialRequests() async {
    List<ReviewedFinancialModel>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.getReviewedFinancial), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData!=null) {
      var Financials = responseData as List;
      a = ( Financials.map((jsonData) =>
          ReviewedFinancialModel.fromJson(jsonData)).toList());
      List<ReviewedFinancialModel>? b = List<ReviewedFinancialModel>.from(a as Iterable);
      FinancialsData = b;
      return FinancialsData;
    } return null;
  }
}

class result {
  final bool isValid;
  final String message;
  const result({
    required this.isValid, required this.message});

  factory result.fromJson(Map<String, dynamic> json) {
    return result(
      isValid: json['IsValid'],
      message: json['Message'],
    );
  }


}
