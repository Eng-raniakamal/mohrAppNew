
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



class ViewFinancial extends StatefulWidget implements NavigationStates
{
  const ViewFinancial ({Key? key}) : super(key: key);
  @override
  State<ViewFinancial> createState() => _viewFinancialiewState();
}

class _viewFinancialiewState extends State<ViewFinancial>with TickerProviderStateMixin {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<Financial>? FinancialsData;


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
                                  FinancialTable()

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


  Widget FinancialTable() {
    return
      FutureBuilder(
          future: getFinancialRequests(),
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
                        child: _createFinancialsTable(FinancialsData!)
                    ),
                  );
            }
          });
  }
  Widget _createFinancialsTable(List<Financial> Financial) {
    if (Financial.isEmpty == false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(Financial),

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


      DataColumn(
          label: Text(
            AppStrings.value.tr(), style: TextStyle(color: colorManager.white),)),

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
  List<DataRow> _createRows(List<Financial> Financial) {
    return Financial
        .map((Financial) =>
        DataRow(cells: [

          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
              Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(Financial.requestDate!)!).toString()),

          ])),
          DataCell(Text((Financial.requestType).toString())),


          DataCell(Text((Financial.value).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: reviewersList(Financial.reviewers))),
          DataCell(Text((Financial.attachments).toString())),
          DataCell(Text((Financial.notes).toString())),
          DataCell(Text((Financial.status).toString())),
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
  Future <List<Financial>?> getFinancialRequests() async {
    try {
      List<Financial>? a;
      userId = await _appPreferences.getUserToken();
      var response = await http.get(
          Uri.parse(Constants.getViewFinancial), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'userId': userId!
      });
          //.timeout(Duration(seconds: 40));

      var responseData = json.decode(response.body).cast<Map<String, dynamic>>();
      if (responseData != null) {
        var Financials = responseData as List;
        a = await Financials.map((jsonData) =>
            Financial.fromJson(jsonData)).toList();
        List<Financial>? b = List<Financial>.from(a as Iterable);
        FinancialsData = b;
        return FinancialsData;
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
      throw Exception('Failed to load Financials data ');
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



