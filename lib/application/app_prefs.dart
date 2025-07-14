// import 'package:essmohr/application/constants.dart';
// import 'package:essmohr/presentation/resources/language_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
// const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
// const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
// final String PREFS_KEY_TOKEN ="PREFS_KEY_TOKEN";
// final String PREFS_USERNAME_TOKEN ="PREFS_USERNAME_TOKEN";
// final String PREFS_ID_TOKEN ="PREFS_ID_TOKEN";
// final String PREFS_List_Notification="PREFS_List_Notification";
// final String PREFS_KEY_CACHED_VACATIONS = "PREFS_KEY_CACHED_VACATIONS";
//
// class AppPreferences {
//   final SharedPreferences _sharedPreferences;
//   AppPreferences(this._sharedPreferences);
//
//   Future<String> getAppLanguage() async {
// //     String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
// // //language=null mean the user didn't save lang in shared preference
// //     if (language != null && language.isNotEmpty) {
// //       return language;
// //     } else {
// //       // return default language considering it is english
// //       return LanguageType.ENGLISH.getValue();
// //     }
// //THE APP LANG  IS ARABIC
//     return LanguageType.ARABIC.getValue();
//   }
//
//
//
//    String? getLanguage()  {
//     String? lang =LanguageType.ARABIC.getValue();
//     //_sharedPreferences.getString(PREFS_KEY_LANG);
// //language=null mean the user didn't save lang in shared preference
//       return lang;
//
//   }
//
//   Future <void> changeAppLanguage()async{
//     String currentLange= await getAppLanguage();
//     if(currentLange==LanguageType.ARABIC.getValue())
//       {
//         //set engilsh
//         //_sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
//         _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
//
//       }
//     else
//     {
//       //set lang arabic
//       _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
//     }
//   }
//
//
//
//   Future<void> setLanguageChanged() async {
//     String currentLanguage = await getAppLanguage();
//     if (currentLanguage == LanguageType.ARABIC.getValue()) {
//       // save prefs with english lang
//       _sharedPreferences.setString(
//           PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
//     } else {
//       // save prefs with arabic lang
//       _sharedPreferences.setString(
//           PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
//     }
//   }
//
//   Future<Locale> getLocal() async {
//     //String currentLanguage= LanguageType.ENGLISH.getValue();
//     String currentLanguage = await getAppLanguage();
//     if (currentLanguage == LanguageType.ARABIC.getValue()) {
//       // return arabic local
//       return ARABIC_LOCAL;
//     } else {
//       // return english local
//       return ENGLISH_LOCAL;
//     }
//   }
// /////////////user Id//////////////////////////
//
//   Future<void> setUserToken(String token) async {
//     _sharedPreferences.setString(PREFS_KEY_TOKEN,token);
//   }
//
//   Future<String> getUserToken() async {
//     return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
//   }
// ////////////////////////////////////////////////
//
//   Future<void> setUserNameToken(String? tokenUserName) async {
//     _sharedPreferences.setString(PREFS_USERNAME_TOKEN,tokenUserName!);
//   }
//
//   Future<String> getUserNameToken() async {
//     return _sharedPreferences.getString(PREFS_USERNAME_TOKEN) ?? "";
//   }
//
//   /////////////////////////////////////////////////
// //////////////////////empId////////////////////
//   Future<void> setEmpIdToken(int? token) async {
//     _sharedPreferences.setInt(PREFS_ID_TOKEN,token!);
//   }
//
//   Future<int> getEmpIdToken() async {
//     return _sharedPreferences.getInt(PREFS_ID_TOKEN) ?? 0;
//   }
//   ////////////////////////////////////////////////
//
//   //login screen
//  //  ///////////////////////////
//   Future<void> setIsUserLoggedIn() async {
//     _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
//   }
//   Future<bool> isUserLoggedIn() async {
//     return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
//   }
//
//  ////////////////////////////////////////////////
//   // user Image//////////////////
//
//
//   //splash screen
//   /////
//   Future<void> setOnBoardingScreenViewed() async{
//     _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
//   }
//   Future<bool> isOnBoardingScreenViewed() async{
//    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN)?? false;
//   }
// //////////////////////////////
//   Future<void> logout() async {
//     _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
//   }
//   ///////////////////////////////////////////
//   Future<void> setUserNotificationList(int lengthOfList) async {
//     _sharedPreferences.setInt(PREFS_List_Notification,lengthOfList);
//   }
//
//   Future <int> getUserNotificationList() async {
//     return _sharedPreferences.getInt(PREFS_List_Notification) ?? 0;
//   }
//
// // حفظ بيانات الإجازات كـ JSON String
//   Future<void> setCachedVacations(String jsonString) async {
//     await _sharedPreferences.setString(PREFS_KEY_CACHED_VACATIONS, jsonString);
//   }
//
// // استرجاع بيانات الإجازات من الكاش
//   String? getCachedVacations() {
//     return _sharedPreferences.getString(PREFS_KEY_CACHED_VACATIONS);
//   }
//
// // (اختياري) لحذف الكاش لو حبيت تنظفه
//   Future<void> clearCachedVacations() async {
//     await _sharedPreferences.remove(PREFS_KEY_CACHED_VACATIONS);
//   }
//
// }
import 'dart:convert';

import 'package:essmohr/application/constants.dart';
import 'package:essmohr/data/mapper/mapper.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/model/model.dart';
import '../presentation/newDesign/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_USERNAME_TOKEN = "PREFS_USERNAME_TOKEN";
const String PREFS_ID_TOKEN = "PREFS_ID_TOKEN";
const String PREFS_List_Notification = "PREFS_List_Notification";
const String PREFS_KEY_CACHED_VACATIONS = "PREFS_KEY_CACHED_VACATIONS"; // ✅ الكاش الجديد
const String _vacationsCacheTimeKey = "CACHED_EMPLOYEE_VACATIONS_TIMESTAMP";//لوقت الكاش
const String _cachedBalancesKey = "CACHED_VACATION_BALANCES";
const String _cachedBalancesTimeKey = "CACHED_VACATION_BALANCES_TIME";
const String PREF_KEY_USER_DATA = "PREF_KEY_USER_DATA";
 const String _cachedVacationTypesKey = "CACHED_VACATION_TYPES";
 const String _cachedVacationTypesTimeKey = "CACHED_VACATION_TYPES_TIME";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  // اللغة
  Future<String> getAppLanguage() async {
    return LanguageType.ARABIC.getValue(); // افتراضيًا عربي
  }

  String? getLanguage() {
    return LanguageType.ARABIC.getValue();
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  // بيانات المستخدم
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  Future<void> setUserNameToken(String? tokenUserName) async {
    _sharedPreferences.setString(PREFS_USERNAME_TOKEN, tokenUserName ?? "");
  }

  Future<String> getUserNameToken() async {
    return _sharedPreferences.getString(PREFS_USERNAME_TOKEN) ?? "";
  }

  Future<void> setEmpIdToken(int? token) async {
    _sharedPreferences.setInt(PREFS_ID_TOKEN, token ?? 0);
  }

  Future<int> getEmpIdToken() async {
    return _sharedPreferences.getInt(PREFS_ID_TOKEN) ?? 0;
  }

  // حالة الدخول
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  // شاشة البداية
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  // الإشعارات
  Future<void> setUserNotificationList(int lengthOfList) async {
    _sharedPreferences.setInt(PREFS_List_Notification, lengthOfList);
  }

  Future<int> getUserNotificationList() async {
    return _sharedPreferences.getInt(PREFS_List_Notification) ?? 0;
  }

  // تسجيل الخروج
  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    await _sharedPreferences.remove(PREFS_KEY_TOKEN);
    await _sharedPreferences.remove(PREFS_USERNAME_TOKEN);
    await _sharedPreferences.remove(PREFS_ID_TOKEN);
  }



  // Future<void> setCachedVacations(String key, List<GetEmployeeVacationsResponseModel> data) async {
  //   final encoded = jsonEncode(data.map((e) => e.toJson()).toList());
  //   _sharedPreferences.setString(key, encoded);
  // }


  Future<void> setCachedVacations(String key, List<GetEmployeeVacationsResponseModel> vacations) async {
    final jsonString = jsonEncode(vacations.map((e) => e.toJson()).toList());
    await _sharedPreferences.setString(key, jsonString);
    await _sharedPreferences.setInt(_vacationsCacheTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  // وقت الكاش
  Future<DateTime?> getCachedVacationsTime() async {
    final timestamp = _sharedPreferences.getInt(_vacationsCacheTimeKey);
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    }
    return null;
  }

  Future<List<GetEmployeeVacationsResponseModel>?> getCachedVacations(String key) async {
    final cachedString = _sharedPreferences.getString(key);
    if (cachedString != null) {
      try {
        final decoded = jsonDecode(cachedString) as List;
        return decoded.map((e) => GetEmployeeVacationsResponseModel.fromJson(e)).toList();
      } catch (_) {
        _sharedPreferences.remove(key);
      }
    }
    return null;
  }

  // ✅ كاش الإجازات
  Future<void> cacheVacations(String vacationsJson) async {
    await _sharedPreferences.setString(PREFS_KEY_CACHED_VACATIONS, vacationsJson);
  }

  Future<void> setCachedBalances(
      String key,
      List<VacationTypeBalancs> balances,
      ) async {
    final jsonList = balances.map((e) => e.toJson()).toList();
    await _sharedPreferences.setString(key, jsonEncode(jsonList));
  }

  Future<void> setCachedBalancesTime(String key, DateTime dateTime) async {
    await _sharedPreferences.setString(key, dateTime.toIso8601String());
  }

  Future<DateTime?> getCachedBalancesTime(String key) async {
    final timeStr = _sharedPreferences.getString(key);
    if (timeStr == null) return null;
    return DateTime.tryParse(timeStr);
  }

  Future<List<VacationTypeBalancs>?> getCachedBalances(String key) async {
    final jsonString = _sharedPreferences.getString(key);
    if (jsonString == null) return null;

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => VacationTypeBalancs.fromJson(e)).toList();
  }
  Future<void> clearCachedVacations() async {
    await _sharedPreferences.remove(PREFS_KEY_CACHED_VACATIONS);
  }

  Future<void> setCachedEntitlements(String key, List<VacationTypeBalancs> entitlements) async {
    final jsonList = entitlements.map((e) => e.toJson()).toList();
    await _sharedPreferences.setString(key, jsonEncode(jsonList));
  }

  Future<List<VacationTypeBalancs>?> getCachedEntitlements(String key) async {
    final jsonString = _sharedPreferences.getString(key);
    if (jsonString == null) return null;

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => VacationTypeBalancs.fromJson(e)).toList();
  }

  Future<void> setCachedEntitlementsTime(String key, DateTime dateTime) async {
    await _sharedPreferences.setString(key, dateTime.toIso8601String());
  }

  Future<DateTime?> getCachedEntitlementsTime(String key) async {
    final timeStr = _sharedPreferences.getString(key);
    if (timeStr == null) return null;
    return DateTime.tryParse(timeStr);
  }



  Future<void> setCachedSalaryTime(String key, DateTime time) async {
    await _sharedPreferences.setString(key, time.toIso8601String());
  }

  Future<DateTime?> getCachedSalaryTime(String key) async {
    final timeStr = _sharedPreferences.getString(key);
    if (timeStr == null) return null;
    return DateTime.tryParse(timeStr);
  }


  Future<void> saveCachedUserData(UserDataModel userData) async {
    final jsonString = jsonEncode(userData.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_KEY_USER_DATA, jsonString);
  }

  // Future<UserDataModel?> getCachedUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = prefs.getString(PREF_KEY_USER_DATA);
  //
  //   if (jsonString != null && jsonString.isNotEmpty) {
  //     final jsonMap = jsonDecode(jsonString);
  //     return UserDataModel.fromJson(jsonMap);
  //   }
  //
  //   return null; // No data
  // }

  Future<void> clearCachedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(PREF_KEY_USER_DATA);
  }





  Future<void> saveCachedVacationTypes(String data) async {
    await _sharedPreferences.setString(_cachedVacationTypesKey, data);
  }

  Future<String?> getCachedVacationTypes() async {
    return _sharedPreferences.getString(_cachedVacationTypesKey);
  }

  Future<void> setVacationTypesCacheTime(DateTime time) async {
    await _sharedPreferences.setString(_cachedVacationTypesTimeKey, time.toIso8601String());
  }

  Future<DateTime?> getVacationTypesCacheTime() async {
    final timeString = _sharedPreferences.getString(_cachedVacationTypesTimeKey);
    if (timeString != null) {
      return DateTime.tryParse(timeString);
    }
    return null;
  }


  static const _cacheKey = 'cached_notifications';
  static const _cacheTimeKey = 'cached_notifications_time';


  static Future<void> saveToCache(List<NotificationModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.map((n) => jsonEncode(n.toJson())).toList();
    await prefs.setStringList(_cacheKey, jsonList);
    await prefs.setInt(_cacheTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<List<NotificationModel>> getFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_cacheKey) ?? [];
    return jsonList.map((item) => NotificationModel.fromJson(jsonDecode(item))).toList();
  }

  static Future<bool> isCacheValid({Duration duration = const Duration(minutes: 5)}) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheTime = prefs.getInt(_cacheTimeKey);
    if (cacheTime == null) return false;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    return (currentTime - cacheTime) < duration.inMilliseconds;
  }











}




