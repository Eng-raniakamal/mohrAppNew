import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/application/functions.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:mohr_hr/presentation/resources/language_manager.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:http/http.dart' as http;

import 'dart:math' as math;

import 'package:mohr_hr/presentation/widgets/appbar_widget.dart';

class ChangePasswordPage extends StatefulWidget {
   ChangePasswordPage({Key? key}) : super(key: key);


  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? userId;
  String? userName;
  bool?  _passwordVisible;
  bool?  _ConfirmpasswordVisible;
  @override
  void  initState()
  {
    super.initState();
    _passwordVisible = true;
    _ConfirmpasswordVisible = true;
  }
  @override
  void didChangeDependencies()
  {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Localizations.override(
        context: context,
        locale:  context.locale,
        delegates: context.localizationDelegates,
        child:
        ThemeSwitchingArea(
            child: Builder(
                builder: (context) =>
                    Scaffold(
                      appBar: buildAppBar(context),
                      body:
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                             height: 50,
                            ),
                            TextFormField(
                            controller: _oldPasswordController,
                            //obscureText: _passwordVisible!,
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                            prefix: const Icon(Icons.local_mall),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                            hintText: AppStrings.old_password.tr(),
                            labelText: AppStrings.old_password.tr(),

                            // suffixIcon:IconButton(icon:
                            // Icon(
                            //   // Based on passwordVisible state choose the icon
                            //   _passwordVisible!
                            //       ? Icons.visibility
                            //       : Icons.visibility_off,
                            //   // color: Theme.of(context).primaryColorDark,
                            // ),
                            //   onPressed: () {
                            //     _passwordVisible!
                            //         ? Icons.visibility
                            //         : Icons.visibility_off;
                            //     setState(() {
                            //       _passwordVisible = !_passwordVisible!;
                            //     });
                            //   },
                            // ),
                          ),
                        ),
                            const SizedBox(
                        height: 15,
                      ),
                            TextFormField(
                              controller: _newPasswordController,
                              obscureText: _passwordVisible!,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                prefix: const Icon(Icons.local_mall),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                hintText: AppStrings.new_password.tr(),
                                labelText: AppStrings.new_password.tr(),
                                suffixIcon:IconButton(icon:
                                Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // color: Theme.of(context).primaryColorDark,
                                ),
                                  onPressed: () {
                                    _passwordVisible!
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                    setState(() {
                                      _passwordVisible = !_passwordVisible!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,

                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: _ConfirmpasswordVisible!,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                prefix: const Icon(Icons.local_mall),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                hintText: AppStrings.confirm_password.tr(),
                                labelText: AppStrings.confirm_password.tr(),

                                suffixIcon:IconButton(icon:
                                Icon(
                                  // Based on passwordVisible state choose the icon
                                  _ConfirmpasswordVisible!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  // color: Theme.of(context).primaryColorDark,
                                ),
                                  onPressed: () {
                                    _ConfirmpasswordVisible!
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                                    setState(() {
                                      _ConfirmpasswordVisible = !_ConfirmpasswordVisible!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height:25,
                            ),
                            Center(
                              child: GestureDetector(
                                  onTap: ()  {

                                  },
                                 child:ElevatedButton(child: Text(AppStrings.change_password.tr()),
                                   onPressed: () async {
                                   await postChangePassword();
                                   }
                                 )
                              ),
                            ),
                        ],
                        ),
                      ),
                    ))

        ));

  }

  Future postChangePassword() async
  {
    userId = await _appPreferences.getUserToken();
    userName= await _appPreferences.getUserNameToken();

    DeviceInfo deviceDetails = await getDeviceDetails();
    String deviceId=deviceDetails.identifier;
    // string to uri
    var uri = Uri.parse(Constants.changePassword);

    // create multipart request
    // var request = http.Request("POST", uri);

    var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8','userId':userId!},
        body: jsonEncode(<String,dynamic>{
          'UserName': userName,
          'Password': _oldPasswordController.text,
          'DeviceId':deviceId,
          'NewPassword': _newPasswordController.text,
          'ConfirmNewPassword':_confirmPasswordController.text}));
    // check the status code for the result
    if (response.statusCode == 200) {
      var x= result.fromJson(jsonDecode(response.body)) ;
      String? y =x.data;
      if(y=="PasswordChangedSuccessfully") {
        displayDialoge(AppStrings.Password_Changed_Successfully.tr());

      }

        if (x.errormessage == "InvalidUserNameOrPassword") {
          displayDialoge(AppStrings.Invalid_Password.tr());

        }
        if (x.errormessage == "InvalidDevice") {
          displayDialoge(AppStrings.Invalid_Device.tr());
        }


    }
    else
      {
        displayFaileDialoge("يوجد خطاء فى ادخال البيانات");
      }
  }




  Widget? displayDialoge( String message)
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          //titleText: AppStrings.Alerts.tr(),
          contentText: message,
          positiveText:  AppStrings.confirm.tr(),
          onPositiveClick: () {
           // Navigator.of(context).pop();
            Navigator.of(context).popAndPushNamed(Routes.HomeRoute);
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
    return null;
  }

  Widget? displayFaileDialoge( String msg)
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: "",
          contentText: msg,
          positiveText:  AppStrings.confirm.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },

        );
      },
      animationType: DialogTransitionType.fade,
      curve: Curves.linear,
      duration: Duration(seconds: 1),
    );
    return null;
  }
}

class result {
  final String? data;
   final String? errormessage;

  const result({
    required this.data, this.errormessage});

  factory result.fromJson(Map<String, dynamic> json) {
    return result(
      data: json['data'],
      errormessage: json['errorMessageCode'],
    );
  }
}
