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

class ReviewedPermission extends StatefulWidget implements NavigationStates
{
  const ReviewedPermission ({Key? key}) : super(key: key);
  @override
  State<ReviewedPermission> createState() => _ReviewedPermissioniewState();
}

class _ReviewedPermissioniewState extends State<ReviewedPermission>with TickerProviderStateMixin {

  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? userId;
  List<ReviewedPermissions>? permissionsData;


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
                                permissionTable()

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

  Widget permissionTable(){
    return
      FutureBuilder(
          future:getReviewedPermissionRequests(),
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
                        child: _createPermissionsTable(permissionsData!)
                    ),
                  );
            }
          });
  }

  Widget _createPermissionsTable(List<ReviewedPermissions> permission) {
    if(permission.isEmpty==false) {
      return DataTable(
        headingRowColor: WidgetStateColor.resolveWith((states) =>
        colorManager.lightprimary),
        columns: _createColumns(),
        rows: _createRows(permission),

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

  List<DataRow> _createRows(List<ReviewedPermissions> permission) {

    return permission
        .map((permission) =>
        DataRow(cells: [

          DataCell(Text((permission.empName).toString())),
          DataCell(Text((permission.empCode).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(permission.date
          !)!).toString()),
          ])),
          DataCell(Text((permission.empDepartment).toString())),
          DataCell(Text((permission.jobTitle).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(permission.from!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(permission.from!)!).toString())
          ])),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: [
            Text(DateFormat('dd-MM-yyyy').format(DateTime.tryParse(permission.to!)!).toString()),
            Text(DateFormat('kk:mm').format(DateTime.tryParse(permission.to!)!).toString())
          ])),
          DataCell(Text((permission.duration).toString())),
          DataCell(Column(mainAxisSize: MainAxisSize.min, children: ReviewersList(permission.reviewers))),
          DataCell(Text((permission.attachments).toString())),
          DataCell(Text((permission.notes).toString())),
          DataCell(Text((permission.status).toString())),
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
  Future <List<ReviewedPermissions>?> getReviewedPermissionRequests() async {
    List<ReviewedPermissions>? a;
    userId = await _appPreferences.getUserToken();
    var response = await http.get(
        Uri.parse(Constants.getReviewedPermission), headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8','userId':userId!});

    var responseData = json.decode(response.body);
    //.cast<Map<String, dynamic>>();
    if(responseData!=null) {
      var permissions = responseData as List;
      a = ( permissions.map((jsonData) =>
          ReviewedPermissions.fromJson(jsonData)).toList());
      List<ReviewedPermissions>? b = List<ReviewedPermissions>.from(a as Iterable);
      permissionsData = b;
      return permissionsData;
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
