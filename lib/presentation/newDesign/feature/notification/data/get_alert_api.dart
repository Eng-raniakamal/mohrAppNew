
import 'dart:convert';

import '../../../../../application/app_prefs.dart';
import '../../../../../application/constants.dart';
import '../../../../../application/di.dart';
import '../../../../../domain/model/model.dart';
import 'package:http/http.dart' as http;
class GetAlertData {
  String? userId;

  //bool isShowSignInDialog = false;

  final AppPreferences _appPreferences = instance<AppPreferences>();
  List<AlertModel>? alerts;


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


}
