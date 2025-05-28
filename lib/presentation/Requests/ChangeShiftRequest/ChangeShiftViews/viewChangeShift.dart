
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



class ViewChangeShift extends StatefulWidget implements NavigationStates
{
  const ViewChangeShift ({Key? key}) : super(key: key);
  @override
  State<ViewChangeShift> createState() => _viewChangeShiftiewState();
}

class _viewChangeShiftiewState extends State<ViewChangeShift>with TickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ChangeShift>? ChangeShiftsData;


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
                                  ChangeShiftTable()

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


  Widget ChangeShiftTable() {
    return
      FutureBuilder(
          future: getChangeShiftRequests(),
          builder: (context, snapshot) {
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
  Widget _createChangeShiftsTable(List<ChangeShift> ChangeShift) {
    if (ChangeShift.isEmpty == false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(ChangeShift),

      );
    } else {
      return Text(AppStrings.noContent.tr());
    }
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: Text(AppStrings.date.tr(),
            style: TextStyle(color: colorManager.white),)),
      DataColumn(
          label: Text(AppStrings.type.tr(),
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
          label: Text(AppStrings.decision, style: TextStyle(color: colorManager.white),)),


    ];
  }
  List<DataRow> _createRows(List<ChangeShift> ChangeShift) {
    return ChangeShift
        .map((ChangeShift) =>
        DataRow(cells: [

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
              Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(ChangeShift.requestDate!)!).toString()),

          ])),
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
  Future <List<ChangeShift>?> getChangeShiftRequests() async {
    try {
      List<ChangeShift>? a;
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.getViewChangeShift), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId!
      });
          //.timeout(Duration(seconds: 40));

      var responseData = json.decode(response.body).cast<Map<String, dynamic>>();
      if (responseData != null) {
        var ChangeShifts = responseData as List;
        a = await ChangeShifts.map((jsonData) =>
            ChangeShift.fromJson(jsonData)).toList();
        List<ChangeShift>? b = List<ChangeShift>.from(a as Iterable);
        ChangeShiftsData = b;
        return ChangeShiftsData;
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
      throw Exception('Failed to load ChangeShifts data ');
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



