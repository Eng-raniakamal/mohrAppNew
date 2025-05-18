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

class ReviewedMission extends StatefulWidget implements NavigationStates
{
  const ReviewedMission ({Key? key}) : super(key: key);
  @override
  State<ReviewedMission> createState() => _ReviewedMissioniewState();
}

class _ReviewedMissioniewState extends State<ReviewedMission>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ReviewedMissions>? MissionsData;


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
                                MissionTable()

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

  Widget MissionTable(){
    return
      FutureBuilder(
          future:getReviewedMissionRequests(),
          builder:(context,snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                        child: _createMissionsTable(MissionsData!)
                    ),
                  );
                }
            }
          });
  }

  Widget _createMissionsTable(List<ReviewedMissions> Mission) {
    if(Mission.isEmpty==false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(Mission),

      );
    }else
    {return Container(child: Text("No Data Found"),);}
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

  List<DataRow> _createRows(List<ReviewedMissions> Mission) {

    return Mission
        .map((Mission) =>
        DataRow(cells: [

          DataCell(Text((Mission.empName).toString())),
          DataCell(Text((Mission.empCode).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(Mission.date
          !)!).toString()),
          ])),
          DataCell(Text((Mission.empDepartment).toString())),
          DataCell(Text((Mission.jobTitle).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(Mission.from!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(Mission.from!)!).toString())
          ])),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(Mission.to!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(Mission.to!)!).toString())
          ])),
          DataCell(Text((Mission.duration).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: ReviewedersList(Mission.reviewers))),
          DataCell(Text((Mission.attachments).toString())),
          DataCell(Text((Mission.notes).toString())),
          DataCell(Text((Mission.status).toString())),
        ]))
        .toList();
  }
  List<Widget> ReviewedersList(List<dynamic> items) {
    return items.map((item) {
      final value = item["Name"] ?? '';
      return
        Text((value).toString());
    }).toList();
  }
  Future <List<ReviewedMissions>?> getReviewedMissionRequests() async {
    List<ReviewedMissions>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.getReviewedMission), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData!=null) {
      var missions = responseData as List;
      a = (await missions.map((jsonData) =>
          ReviewedMissions.fromJson(jsonData)).toList());
      List<ReviewedMissions>? b = List<ReviewedMissions>.from(a as Iterable);
      MissionsData = b;
      return MissionsData;
    } return null;
  }
}

class Result {
  final bool isValid;
  final String message;
  const Result({
    required this.isValid, required this.message});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      isValid: json['IsValid'],
      message: json['Message'],
    );
  }


}
