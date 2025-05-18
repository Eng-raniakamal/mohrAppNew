
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



class ViewVacation extends StatefulWidget implements NavigationStates
{
  const ViewVacation ({Key? key}) : super(key: key);
  @override
  State<ViewVacation> createState() => _viewVacationViewState();
}

class _viewVacationViewState extends State<ViewVacation>with TickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<VacationRequests>? VacationsData;

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
                                    vacationTable()

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
  Widget vacationTable() {
    return
      FutureBuilder(
          future: getVacationRequests(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Center(
                        child: _createVacationsTable(VacationsData!)
                    ),
                  );
                }
            }
          });
  }
  Widget _createVacationsTable(List<VacationRequests> vacation) {
    if (vacation.isEmpty == false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(vacation),

      );
    } else {
      return  Text(AppStrings.noContent.tr());
    }
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text(AppStrings.date.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(AppStrings.from.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(AppStrings.to.tr(), style: TextStyle(color: colorManager.white),)),
      DataColumn(label: Text(
        AppStrings.period.tr(), style: TextStyle(color: colorManager.white),)),
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
          label: Text(AppStrings.destination.tr(), style: TextStyle(color: colorManager.white),)),


    ];
  }
  List<DataRow> _createRows(List<VacationRequests> vacation) {
    return vacation
        .map((vacation) =>
        DataRow(cells: [

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(vacation.requestDate!)!).toString()),
            //Text(DateFormat('kk:mm:ss').format(DateTime.tryParse(vacation.requestDate!)!).toString())
          ])),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(vacation.from!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(vacation.from!)!).toString())
          ])),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(vacation.to!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(vacation.to!)!).toString())
          ])),
          DataCell(Text((vacation.duration).toString())),
          DataCell(Text((vacation.vacationTypeName).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: reviewersList(vacation.reviewers))),
          DataCell(Text((vacation.attachments).toString())),
          DataCell(Text((vacation.status).toString())),
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
  Future <List<VacationRequests>?> getVacationRequests() async {
    try {
      List<VacationRequests>? a;
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.getViewVacations), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId!
      });
      //.timeout(Duration(seconds: 40));

      var responseData = json.decode(response.body).cast<Map<String, dynamic>>();
      if (responseData != null) {
        var vacations = responseData as List;
        a = await vacations.map((jsonData) =>
            VacationRequests.fromJson(jsonData)).toList();
        List<VacationRequests>? b = List<VacationRequests>.from(a as Iterable);
        VacationsData = b;
        return VacationsData;
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
      throw Exception('Failed to load Vacations data ');
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



