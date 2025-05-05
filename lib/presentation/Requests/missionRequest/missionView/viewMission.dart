
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';
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



class ViewMission extends StatefulWidget implements NavigationStates
{
  const ViewMission ({Key? key}) : super(key: key);
  @override
  State<ViewMission> createState() => _viewMissioniewState();
}

class _viewMissioniewState extends State<ViewMission>with TickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<Missions>? MissionsData;


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
                body:
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                      children: [
                        Form(
                          child: Container(
                              padding: const EdgeInsets.only(
                                  top: 12,
                                  left: 28,
                                  right: 28),
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center
                                      , children: [
                                    const SizedBox(height: 30),
                                    MissionTable()

                                  ]
                                  )
                              )
                          ),
                        )

                      ]),
                ),
              ),
        ),
      );
  }


  Widget MissionTable() {
    return
      FutureBuilder(
          future: getMissionRequests(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Center(
                      child: _createMissionsTable(MissionsData!)
                  );
            }
          });
  }
  Widget _createMissionsTable(List<Missions> Mission) {
    if (Mission.isEmpty == false) {
      return DataTable(
        headingRowColor: MaterialStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(Mission),

      );
    } else {
      return Container(child: Text("No Data Found"),);
    }
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.date.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.destination.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.from.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(
            AppStrings.to.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.period.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.Reviewers.tr(),
        style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.attachments.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.notes.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(
            "Decision", style: TextStyle(color: colorManager.white),)),


    ];
  }
  List<DataRow> _createRows(List<Missions> mission) {
    return mission
        .map((mission) =>
        DataRow(cells: [

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(mission.requestDate!)!).toString()),
            //Text(DateFormat('kk:mm:ss').format(DateTime.tryParse(Mission.requestDate!)!).toString())
          ])),
          DataCell(Text((mission.destination).toString())),

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(mission.from!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(mission.from!)!).toString())
          ])),

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(mission.to!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(mission.to!)!).toString())
          ])),

          DataCell(Text((mission.duration).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: reviewersList(mission.reviewers))),
          DataCell(Text((mission.attachments).toString())),
          DataCell(Text((mission.notes).toString())),
          DataCell(Text((mission.status).toString())),
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
  Future <List<Missions>?> getMissionRequests() async {
    try {
      List<Missions>? a;
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.getMission), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId!
      });
      //.timeout(Duration(seconds: 40));

      var responseData = json.decode(response.body).cast<Map<String, dynamic>>();
      if (responseData != null) {
        var missions = responseData as List;
        a = await missions.map((jsonData) =>
            Missions.fromJson(jsonData)).toList();
        List<Missions>? b = List<Missions>.from(a as Iterable);
        MissionsData = b;
        return MissionsData;
      }
      return null;
    }

    on TimeoutException catch (e) {
      print('Timeout Error: $e');
      throw Exception('Timeout  ');
    } on SocketException catch (e) {
      print('Socket Error: $e');
      throw Exception("no internet");
    } catch (e) {
      print('General Error: $e');
      throw Exception('Failed to load Missions data ');
    }
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



