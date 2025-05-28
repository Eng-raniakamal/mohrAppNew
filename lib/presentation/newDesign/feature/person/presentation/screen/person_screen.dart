import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/tab_cubit/tab_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/%20tab_of_app_bar_switcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/info_data_widget.dart';
import '../widget/tab_education/education_data_widget.dart';
import '../widget/tab_skill/skill_data_widget.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  PersonScreenState createState() => PersonScreenState();
}

class PersonScreenState extends State<PersonScreen> {
 // List<Widget> listBody = [InfoDataWidget(), Text("data"), Text("data")];




  final  List<Widget> listBody = [
    InfoDataWidget(),
    SkillDataWidget(),
   EducationDataWidget()
  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الملف الشخصي', style: AppTextStyle.iBMP24w600),
              TabOfAppBarSwitcher(),
            ],
          ),
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

