import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/data/skill_model.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_skill/item_skill_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../editEmployee/View/empSkills_view.dart';
import '../../../../../../editEmployee/ViewModel/displayEmpSkills_viewModel.dart';

class AllSkillDataWidget extends StatefulWidget {
  const AllSkillDataWidget({super.key});

  @override
  State<AllSkillDataWidget> createState() => _AllSkillDataWidgetState();
}

class _AllSkillDataWidgetState extends State<AllSkillDataWidget> {

  final DisplayEmpSkillsViewModel _displayViewModel = instance<
      DisplayEmpSkillsViewModel>();

  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey = GlobalKey<FormState>();
  DateTime date = DateTime(2023);
  String? userId;
  List<UserSkills> skillsUpdate=[];


  @override
  void initState() {

    super.initState();
    //_blind();
    setState(() {
      skillsUpdate;
    });
  }
  @override
  void dispose() {
    _displayViewModel.dispose();
   // _saveviewModel.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title:AppStrings.Skills.tr(),subTitle: "الترتيب حسب",),
        SizedBox(height: 16.h),
    StreamBuilder<getEmpSkillsModel>(
    stream: _displayViewModel.outputEmpSkill,
    builder: (context, snapshot) {


    return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: skillsUpdate.length,
    itemBuilder: (context, index) {
    return ItemSkillWidget(skillModel: skillsUpdate[index]);
    },
    );
    }),

        CustomElevatedButtonWidget(
          icon: Icons.add,
          data: AppStrings.Add.tr(),
          onPressed: () {
            BlocProvider.of<SkillPageCubit>(context).changePage(1);
          },
        ),
      ],
    );
  }
}





