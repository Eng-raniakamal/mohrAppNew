import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign//feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign//feature/person/data/skill_model.dart';
import 'package:essmohr/presentation/newDesign//core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign//core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_skill/item_skill_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllSkillDataWidget extends StatelessWidget {
  const AllSkillDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "جميع المهارات",subTitle: "الترتيب حسب",),
        SizedBox(height: 16.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: EducationAndSkillModel.listSkill.length,
          itemBuilder: (context, index) {
            return ItemSkillWidget(skillModel: EducationAndSkillModel.listSkill[index]);
          },
        ),

        CustomElevatedButtonWidget(
          icon: Icons.add,
          data: "أضف",
          onPressed: () {
            BlocProvider.of<SkillPageCubit>(context).changePage(1);
          },
        ),
      ],
    );
  }
}





