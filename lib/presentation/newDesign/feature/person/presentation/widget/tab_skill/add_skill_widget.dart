import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign//feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign//core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_info_data/input_birth_day_widget.dart';
import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_skill/input_skill_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSkillWidget extends StatelessWidget {
  AddSkillWidget({super.key});

 final TextEditingController skillController = TextEditingController();
 final TextEditingController degreeSkillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<SkillPageCubit>(context).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.all(8).r,
                color: Color(0xffF2F5F9),
                child: Icon(Icons.close),
              ),
            ),
            SizedBox(width: 12.w),
            Text("اضافة مهارة جديدة", style: AppTextStyle.iBMP24w600),
          ],
        ),
        SizedBox(height: 8.h),
        InputSkillDataWidget(
          title: "المهارة",
          hint: "اختر المهارة",
          controller: skillController,
        ),
        SizedBox(height: 16.h),
        InputSkillDataWidget(
          title: "الدرجة",
          hint: "اختر المهارة",
          controller: degreeSkillController,
        ),
        SizedBox(height: 16.h),
        InputBirthDayWidget(
          data: "التاريخ",

        ),
        SizedBox(height: 44.h),
        CustomElevatedButtonWidget(data: "حفظ",onPressed: (){
          BlocProvider.of<SkillPageCubit>(context).changePage(0);
        },)
      ],
    );
  }
}

