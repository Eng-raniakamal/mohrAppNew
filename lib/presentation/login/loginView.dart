import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/di.dart';

import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/login/loginviewmodel.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';

import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/routes.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:mohr_hr/presentation/widgets/clipPath.dart';



bool?  _passwordVisible;

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
// dependency injection

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();// tell view model start your job
    _emailController
        .addListener(() => _viewModel.setemail(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      // navigate to profile screen
      if (isLoggedIn) {
        // navigate to profile (home )screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setIsUserLoggedIn();
          resetModules();
          Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
        }
        );
      }
    });
  }
  @override
  void initState() {
    _bind();
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
      child: Builder(
          builder: (context) =>
       Scaffold(
         //appBar: buildAppBarMain(context),
        backgroundColor: colorManager.white,
         body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    ))
    );
  }



  Widget _getContentWidget() {
    return Container(
            padding: const EdgeInsets.all(0.0),
       // padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                  Padding(
                   padding: const EdgeInsets.all(2.0),
 /////////////////////////////////////////////////////
                      child: Stack(
                       children: [
                         ClipPath(
                           clipper: CustomClipPathOpecity(),
                           child: Container(
                             width: MediaQuery.of(context).size.width,
                             height: 170,
                             decoration:  BoxDecoration(color:Colors.grey[300],
                             ),
                           ),),
                         ClipPath(
                           clipper: CustomClipPath(),
                           child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration:  BoxDecoration(
                          gradient: LinearGradient(
                              colors: [colorManager.primary, colorManager.lightprimary, colorManager.grey],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                      ),),


                       ])
///////////////////////////////////////////////////////
                         ),
//delete the  log
                  const Image(image: AssetImage(ImageAssets.startLogo)),
                // const SizedBox(height: AppSize.s28),

                Container(
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(

                      border: Border.all(
                        width: 4,
                          color: colorManager.lightprimary
                      ),
                      borderRadius: BorderRadius.circular(18),
                      //color: colorManager.lightprimary
                    ),

                // color: colorManager.lightblue,
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: StreamBuilder<bool>(
                        stream: _viewModel.outputIsEmailValid,
                        builder: (context, snapshot) {
                          return TextFormField(

                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefix: Icon(Icons.account_box),
                                border: OutlineInputBorder(),
                                hintText: AppStrings.email.tr(),
                                labelText: AppStrings.email.tr(),
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.emailError.tr()),


                          );
                        },
                      ),
                    ),


                   const SizedBox(height: AppSize.s28),
                    Padding(
                     padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                      child: StreamBuilder<bool>(
                        stream: _viewModel.outputIsPasswordValid,
                        builder: (context, snapshot) {
                        return TextFormField(

                        controller: _passwordController,
                          obscureText: _passwordVisible!,
                          keyboardType: TextInputType.visiblePassword,

                        decoration: InputDecoration(
                          prefix: Icon(Icons.local_mall),
                          border: OutlineInputBorder(),
                            hintText: AppStrings.password.tr(),
                            labelText: AppStrings.password.tr(),
                            errorText: (snapshot.data ?? true)
                                ? null
                                : AppStrings.passwordError.tr(),

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



));


                      //);
                    },
                  ),
                ),
                    const SizedBox(height: AppSize.s28),
                    Padding(
                     padding: const EdgeInsets.only(
                        left: AppPadding.p28, right: AppPadding.p28),
                     child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed:
                              (snapshot.data ?? false)
                                  ? () {
                                _viewModel.login();
                                //
                              }
                                  : null,
                              child: Text(AppStrings.login.tr())),
                        );
                      },
                    )
                ),
      ]
               )


        // TODO CREATE FORGET PASSWORD
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: AppPadding.p8,
                //     left: AppPadding.p28,
                //     right: AppPadding.p28,
                //   ),
                //   // child: Row(
                //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   //   children: [
                //   //
                //   //   ],
                )])
    ),
                )
    )
    ;

  }



  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
