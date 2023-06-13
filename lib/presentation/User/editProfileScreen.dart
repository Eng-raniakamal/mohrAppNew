import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/domain/model/user.dart';
//import 'package:user_profile_ii_example/page/edit_profile_page.dart';
import 'package:mohr_hr/domain/model/user_preferences.dart';
import 'package:mohr_hr/presentation/widgets/appbar_widget.dart';
import 'package:mohr_hr/presentation/widgets/button_widget.dart';
import 'package:mohr_hr/presentation/widgets/numbers_widget.dart';
import 'package:mohr_hr/presentation/widgets/profile_widget.dart';
import 'package:mohr_hr/presentation/widgets/textfield_widget.dart';
class editProfileScreen extends StatefulWidget {
  @override
  _editProfileScreenState createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {
  //User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) =>
      ThemeSwitchingArea(
        child: Builder(
          builder: (context) =>
              Scaffold(
                appBar: buildAppBar(context),
                body: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  physics: BouncingScrollPhysics(),
                  children: [
                    ProfileWidget(
                      imagePath: Constants.imagePath,
                      isEdit: true,
                      onClicked: () async {},
                    ),
                    const SizedBox(height: 24),

                    TextFieldWidget(
                      label: 'English Name',
                      text: "Rania kamal sayed",
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Arabic Name',
                      text: "رانيا كمال سيد",
                      onChanged: (name) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: "Email",
                      text: 'raniakamal.84@gmail.com',
                      onChanged: (email) {},
                    ),
                    const SizedBox(height: 24),
                  ButtonWidget(buttonBgColor: Colors.orange,
                  text: 'Update',
                  onClicked: () {},
                 )

                  ],
                ),
              ),
        ),
      );
}