import 'package:essmohr/presentation/newDesign/core/configure/route/app_route.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/login/presentation/widget/custom_email_input_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/login/presentation/widget/header_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/valid_utils.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailControl.dispose();
    passwordControl.dispose();
    super.dispose();
  }

  // bool pass=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
          builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h, width: double.infinity),
                  HeaderWidget(),
                  SizedBox(height: 24.h),
                  Text("البريد الإلكتروني", style: AppTextStyle.iBMP14w700),
                  SizedBox(height: 8.h),
                  CustomInputWidget(
                    emailControl: emailControl,
                    hintText: "example@gmail.com",
                    validator: (input) {
                      return ValidUtils.ifValidEmail(input);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text("كلمة المرور", style: AppTextStyle.iBMP14w700),
                  SizedBox(height: 8.h),
                  CustomInputWidget(
                    validator: (input) {
                      return ValidUtils.ifValidPassword(input);
                    },
                    emailControl: passwordControl,
                    hintText: "كلمة المرور",
                    obscureText: true,
                    isPassWordInput: true,
                  ),
                  SizedBox(height: 100.h),

                  CustomButtonWidget(
                    onTap: () {
                      // if (!formKey.currentState!.validate()) {
                      //   return;
                      // }
Navigator.pushReplacementNamed(context, AppRoute.layout);
                    },
                    title: "تسجيل الدخول",
                    colorTitle: AppColor.titleButton,
                    color: AppColor.buttonLogin,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

// //name
// TextFomFieldModel(
//   text: "Full Name",
//   controller: nameControl,
//   valid: (text) {
//     return ValidUtils.ifValidName(text);
//   },
//   suffixIcon: Icon(
//     Icons.person,
//     color: Theme.of(context).primaryColor,
//   ),
// ),
// const SizedBox(height: 15),
// //email
// TextFomFieldModel(
//   suffixIcon: Icon(
//     Icons.email,
//     color: Theme.of(context).primaryColor,
//   ),
//   valid: (email) {
//     return ValidUtils.ifValidEmail(email);
//   },
//   text: "Email",
//   controller: emailControl,
//   textInputType: TextInputType.emailAddress,
// ),
// const SizedBox(height: 15),
// //pass
// TextFomFieldModel(
//   valid: (text) {
//     return ValidUtils.ifValidPassword(text);
//   },
//   textInputType: TextInputType.number,
//   text: "Password",
//   controller: passControl,
// ),
// const SizedBox(height: 15),
//
// //confPass
// TextFomFieldModel(
//   valid: (text) {
//     return ValidUtils.ifValidPasswordConfirm(
//       text,
//       passControl.text,
//     );
//   },
//   textInputType: TextInputType.number,
//   text: "Conform Password",
//   controller: ConfpassControl,
// ),
// const SizedBox(height: 15),
// ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     padding: const EdgeInsets.symmetric(vertical: 8),
//   ),
//   onPressed: () async {
//     // ValidUtils.register(formKey,emailControl.text,
//     //     passControl.text,context);
//
//     // if( ValidUtils.register(
//     //     formKey,emailControl.text,passControl.text,context)
//     // ){
//     //   Navigator.pushReplacementNamed(context, HomePage.routeName);
//     // }
//   },
//   child: Text("Register"),
// ),
// TextButton(
//   onPressed: () {
//     // Navigator.pushReplacementNamed(context, loginScreen.routeName);
//   },
//   child: Text("Already You have account ? login "),
// ),
