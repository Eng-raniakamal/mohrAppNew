import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/application/functions.dart';
import 'package:essmohr/data/data_source/local_data_source.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/language_manager.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:http/http.dart' as http;

import 'dart:math' as math;

import 'package:essmohr/presentation/widgets/appbar_widget.dart';

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
        displayDialog(AppStrings.Password_Changed_Successfully.tr());

      }

        if (x.errormessage == "InvalidUserNameOrPassword") {
          displayDialog(AppStrings.Invalid_Password.tr());

        }
        if (x.errormessage == "InvalidDevice") {
          displayDialog(AppStrings.Invalid_Device.tr());
        }


    }
    else
      {
        displayFailureDialog("يوجد خطاء فى ادخال البيانات");
      }
  }




  void displayDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: AppStrings.confirm.tr(),
      desc: message,
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).popAndPushNamed(Routes.homeRoute);
      },
    ).show();
  }

  void displayFailureDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: AppStrings.Alerts.tr(),
      desc: message,
      btnOkText: AppStrings.confirm.tr(),
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    ).show();
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
