
import 'package:flutter/material.dart';

import 'package:essmohr/presentation/widgets/component.dart';
//import 'package:essmohr/presentation/profile/profileScreen.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';



class singinScreen extends StatefulWidget {
  const singinScreen({Key? key}) : super(key: key);

  @override
  _singinScreenState createState() => _singinScreenState();
}

class _singinScreenState extends State<singinScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
        builder: (context) =>
        Scaffold(
      appBar: buildAppBar(context,"login"),

      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                    child: Image.asset("assets/images/Logo.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      prefix:Icons.account_circle ,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        } else if (!RegExp(
                                r"^[a-zA-Z]+[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+[a-zA-Z0-9]+.[a-zA-Z]{3,5}")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  MyFormField(
                      type: TextInputType.visiblePassword,
                      prefix: Icons.local_mall,
                      controller: passwordController,

                      suffix: isPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      isPassword: isPassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      label: "Password"),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      text: 'Login',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                              duration: Duration(seconds: 2),
                              backgroundColor: colorManager.red,
                              // animation: AnimatedIcon(icon: Icon(Icons.animation), progress:),
                            ),
                          );

                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>  ProfileScreen()));
                         }
                      }),

                 // )
                ],
              ),
            ),
          ),
        ),
      ),
    )));
  }
}
