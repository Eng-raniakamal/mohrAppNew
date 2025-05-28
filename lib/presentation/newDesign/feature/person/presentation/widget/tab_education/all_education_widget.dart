import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/education_page/education_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/data/skill_model.dart';

import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_skill/item_skill_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/component/header_core_widget.dart';

class AllEducationWidget extends StatelessWidget {
  const AllEducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "الدرجة العلمية",subTitle: "الترتيب حسب",),
        SizedBox(height: 16.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: EducationAndSkillModel.listEducation.length,
          itemBuilder: (context, index) {
            return ItemSkillWidget(skillModel: EducationAndSkillModel.listEducation[index]);
          },
        ),

        // CustomElevatedButtonWidget(
        //   icon: Icons.add,
        //   data: "أضف",
        //   onPressed: () {
        //     BlocProvider.of<EducationPageCubit>(context).changePage(1);
        //   },
        // ),
      ],
    );
  }
}





