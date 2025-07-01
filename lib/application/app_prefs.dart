import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
final String PREFS_KEY_TOKEN ="PREFS_KEY_TOKEN";
final String PREFS_USERNAME_TOKEN ="PREFS_USERNAME_TOKEN";
final String PREFS_ID_TOKEN ="PREFS_ID_TOKEN";
final String PREFS_List_Notification="PREFS_List_Notification";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
//     String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
// //language=null mean the user didn't save lang in shared preference
//     if (language != null && language.isNotEmpty) {
//       return language;
//     } else {
//       // return default language considering it is english
//       return LanguageType.ENGLISH.getValue();
//     }
//THE APP LANG  IS ARABIC
    return LanguageType.ARABIC.getValue();
  }



   String? getLanguage()  {
    String? lang =LanguageType.ARABIC.getValue();
    //_sharedPreferences.getString(PREFS_KEY_LANG);
//language=null mean the user didn't save lang in shared preference
      return lang;

  }

  Future <void> changeAppLanguage()async{
    String currentLange= await getAppLanguage();
    if(currentLange==LanguageType.ARABIC.getValue())
      {
        //set engilsh
        //_sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
        _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());

      }
    else
    {
      //set lang arabic
      _sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }



  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // save prefs with english lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // save prefs with arabic lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    //String currentLanguage= LanguageType.ENGLISH.getValue();
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.ARABIC.getValue()) {
      // return arabic local
      return ARABIC_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }
/////////////user Id//////////////////////////

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN,token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }
////////////////////////////////////////////////

  Future<void> setUserNameToken(String? tokenUserName) async {
    _sharedPreferences.setString(PREFS_USERNAME_TOKEN,tokenUserName!);
  }

  Future<String> getUserNameToken() async {
    return _sharedPreferences.getString(PREFS_USERNAME_TOKEN) ?? "";
  }

  /////////////////////////////////////////////////
//////////////////////empId////////////////////
  Future<void> setEmpIdToken(int? token) async {
    _sharedPreferences.setInt(PREFS_ID_TOKEN,token!);
  }

  Future<int> getEmpIdToken() async {
    return _sharedPreferences.getInt(PREFS_ID_TOKEN) ?? 0;
  }
  ////////////////////////////////////////////////

  //login screen
 //  ///////////////////////////
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

 ////////////////////////////////////////////////
  // user Image//////////////////


  //splash screen
  /////
  Future<void> setOnBoardingScreenViewed() async{
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
  }
  Future<bool> isOnBoardingScreenViewed() async{
   return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN)?? false;
  }
//////////////////////////////
  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
  ///////////////////////////////////////////
  Future<void> setUserNotificationList(int lengthOfList) async {
    _sharedPreferences.setInt(PREFS_List_Notification,lengthOfList);
  }

  Future <int> getUserNotificationList() async {
    return _sharedPreferences.getInt(PREFS_List_Notification) ?? 0;
  }



}
