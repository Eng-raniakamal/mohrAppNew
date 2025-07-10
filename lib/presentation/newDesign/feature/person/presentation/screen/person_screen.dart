import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../control/tab_person_screen_cubit/tab_cubit.dart';
import '../widget/info_data_widget.dart';
import '../widget/tab_education/education_data_widget.dart';
import '../widget/tab_of_app_bar_switcher.dart';
import '../widget/tab_skill/skill_data_widget.dart';

// class PersonScreen extends StatefulWidget {
//   const PersonScreen({super.key});
//   @override
//   PersonScreenState createState() => PersonScreenState();
// }
//
//
// class PersonScreenState extends State<PersonScreen> {
//   final  List<Widget> listBody =
//   [
//     InfoDataWidget(),
//     SkillDataWidget(),
//     EducationDataWidget()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TabCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//
//           title: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child:
//     Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(AppStrings.profile.tr(), style:context.text.titleLarge,),//AppTextStyle.iBMP18w700),
//               TabOfAppBarSwitcher(),
//             ],
//           ),
//         )),
//         body: BlocBuilder<TabCubit, int>
//           (
//           builder: (context, state) {
//             return listBody[state];
//           },
//         ),
//       ),
//     );
//   }
// }

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});
  @override
  PersonScreenState createState() => PersonScreenState();
}

class PersonScreenState extends State<PersonScreen> {
  final List<Widget> listBody = [
    InfoDataWidget(),
    SkillDataWidget(),
    EducationDataWidget(),
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => TabCubit(),
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text(
  //           AppStrings.profile.tr(),
  //           style: context.text.titleLarge,
  //         ),
  //         bottom: PreferredSize(
  //           // حجم الـ Switcher
  //           preferredSize: Size(double.infinity, 48.h),
  //           child: Padding(
  //             padding: EdgeInsets.only(bottom: 8.h),
  //             child: Center(
  //               child: TabOfAppBarSwitcher(),
  //             ),
  //           ),
  //         ),
  //       ),
  //       body: BlocBuilder<TabCubit, int>(
  //         builder: (context, state) {
  //           return listBody[state];
  //         },
  //       ),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: Scaffold(
        appBar: AppBar(
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //               AppStrings.profile.tr(),
          //               style: context.text.titleLarge,
          //             ),//AppTextStyle.iBMP24w600),
          //     TabOfAppBarSwitcher(),
          //   ],
          // ),
        //  appBar: AppBar(
            title: Row(
              children: [
                Flexible(
                  child: Text(
                    AppStrings.profile.tr(),
                    style: context.text.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8), // مسافة بسيطة بين النص و التبويبات
                Flexible( // اجعل الـ TabOfAppBarSwitcher مرنًا
                  child: TabOfAppBarSwitcher(),
                ),
              ],
            ),
         // ),
        ),
        body: BlocBuilder<TabCubit, int>(
          builder: (context, state) {
            return listBody[state];
          },
        ),
      ),
    );
  }
}




