import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mohr_hr/data/request/request.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
const String UserId="userId";

class DioFactory {
  AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    //set the time of request

   String timeOut = Constants.apitimeout.toString();
   Duration _timeOut =Constants.apitimeout;// 1 min
    String language = await _appPreferences.getAppLanguage();
    //_appPreferences.setUserToken(Constants.token);
    String token = await _appPreferences.getUserToken();
    String tokenEmpId=await _appPreferences.getEmpIdToken().toString();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: token,
      DEFAULT_LANGUAGE: language,
      UserId:token,
      //empId: tokenEmpId,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);


    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      //to see all logs of api in debug mode only
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true,
          responseHeader: true));


    }

    return dio;
  }
}
