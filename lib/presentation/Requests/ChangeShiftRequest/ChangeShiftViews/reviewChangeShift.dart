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

class ReviewChangeShift extends StatefulWidget implements NavigationStates
{
  const ReviewChangeShift ({Key? key}) : super(key: key);
  @override
  State<ReviewChangeShift> createState() => _ReviewChangeShiftiewState();


}

class _ReviewChangeShiftiewState extends State<ReviewChangeShift>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ReviewChangeShiftModel>? ChangeShiftsData;


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
                                ChangeShiftTable()

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

  Widget ChangeShiftTable(){
    return
      FutureBuilder(
          future:getReviewChangeShiftRequests(),
          builder:(context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Center(
                        child: _createChangeShiftsTable(ChangeShiftsData!)
                    ),
                  );
            }
          });
  }

  Widget _createChangeShiftsTable(List<ReviewChangeShiftModel> ChangeShift) {
    if(ChangeShift.isEmpty==false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(ChangeShift),

      );
    }else
    {return Text(AppStrings.noContent.tr());}
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

  List<DataRow> _createRows(List<ReviewChangeShiftModel> ChangeShift) {

    return ChangeShift
        .map((ChangeShift) =>
        DataRow(cells: [

          DataCell(Text((ChangeShift.empName).toString())),
          DataCell(Text((ChangeShift.empCode).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(ChangeShift.date
          !)!).toString()),
          ])),
          DataCell(Text((ChangeShift.empDepartment).toString())),
          DataCell(Text((ChangeShift.jobTitle).toString())),
          DataCell(Text((ChangeShift.value).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: reviewersList(ChangeShift.reviewers))),
          DataCell(Text((ChangeShift.attachments).toString())),
          DataCell(Text((ChangeShift.notes).toString())),
          DataCell(Text((ChangeShift.status).toString())),
        ]))
        .toList();
  }
  List<Widget> reviewersList(List<dynamic> items) {
    return items.map((item) {
      final value = item["Name"] ?? '';
      return
        Text((value).toString());
    }).toList();

  }
  Future <List<ReviewChangeShiftModel>?> getReviewChangeShiftRequests() async {
    List<ReviewChangeShiftModel>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.getReviewChangeShift), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData!=null) {
      var ChangeShifts = responseData as List;
      a = (ChangeShifts.map((jsonData) =>
          ReviewChangeShiftModel.fromJson(jsonData)).toList());
         List<ReviewChangeShiftModel>? b = List<ReviewChangeShiftModel>.from(a as Iterable);
      ChangeShiftsData = b;
      return ChangeShiftsData;
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
