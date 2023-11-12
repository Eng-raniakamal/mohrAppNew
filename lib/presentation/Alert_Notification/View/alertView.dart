import 'dart:convert';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';


import 'package:http/http.dart' as http;
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/themes/style.dart';


class AlertView extends StatefulWidget {
  const AlertView({super.key});
  @override
  State<AlertView> createState() => _AlertViewState();
}

class _AlertViewState extends State<AlertView> {

  String? userId;

  //bool isShowSignInDialog = false;

  final AppPreferences _appPreferences = instance<AppPreferences>();

  //final EmployeeSkillsViewModel _saveviewModel = instance<EmployeeSkillsViewModel>();
  final _Formkey = GlobalKey<FormState>();
  List<AlertModel>? alerts;

  _bind() {
    //_appPreferences.setOnBoardingScreenViewed();

    // alerts= await getApiAlert();
    start();
  }

  Future<void> start() async {
    alerts = await getApiAlert();
  }


  @override
  void initState() {
    //_bind();

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
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 0, 30, 0),
                              child: Alerttable()),

                      )
                  ));
  }

  Widget _listOfAlert() {
    //start();
    if(alerts!=null) {
      return ListView.builder(
          itemCount: alerts?.length,
          itemBuilder: (context, index) {
            return
              Card(color: colorManager.lightprimary,
                  child: ListTile(

              title: Text(alerts![index].content),
              subtitle: Text(alerts![index].link),
              leading: Icon(Icons.add_alert_rounded,color: colorManager.white,),

              //trailing: const Icon(Icons.arrow_forward_ios),
              ));
          });
    }
    return Container();
  }

  Future <List<AlertModel>?> getApiAlert() async
  {
    userId = await _appPreferences.getUserToken();
    var uri = Uri.parse(Constants.getAlertUrl);
    List<AlertModel>? a;

    var response = await http.get(
        uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!
    });

    final responseData = json.decode(response.body);
    if (responseData != null) {
      var userAlerts = responseData as List;

      a = userAlerts.map((data) => AlertModel.fromJson(data)).toList();
      alerts = List<AlertModel>.from(a as Iterable);
      return alerts;
    }
    return null;
  }


  // Widget alertListView() {
  //   alerts?.map((alert) {
  //     return ListView.builder(
  //         padding: const EdgeInsets.all(8),
  //         itemCount: alerts?.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Container(
  //               height: 50,
  //               margin: EdgeInsets.all(2),
  //               color: Colors.blue[400],
  //               child: Center(
  //                   child: Card(
  //                       child:
  //                       Column(
  //                           children: [
  //                             Text(alert.content),
  //                             Text(alert.link ?? ""),
  //                           ])
  //
  //                   )));
  //         });
  //   }).toList();
  //   return Container();
  // }


  Widget Alerttable() {
    return
      FutureBuilder(
          future: getApiAlert(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(
                      child: _listOfAlert()
                  );
                }
            }
          }
      );
  }


}