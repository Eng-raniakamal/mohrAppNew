import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/education_page/education_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/skill_page/skill_page_cubit.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_date_day_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationWidget extends StatelessWidget {
  AddEducationWidget({super.key});

 final TextEditingController nameUnvController = TextEditingController();
 final TextEditingController filedEduController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<EducationPageCubit>(context).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.all(8).r,
                color: Color(0xffF2F5F9),
                child: Icon(Icons.close),
              ),
            ),
            SizedBox(width: 12.w),
            Text("اضافة درجة علمية", style:context.text.displayMedium)// AppTextStyle.iBMP24w600),
          ],
        ),
        SizedBox(height: 8.h),
        InputDataWidget(
          title: "جامعة/معهد",
          hint: "اكتب اسم الجامعة/ المعهد",

          controller: nameUnvController,
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "التخصص",
          hint: "اكتب اسم التخصص",
          controller: filedEduController,
        ),
        SizedBox(height: 16.h),
        InputDateDayWidget(
          data: "التاريخ",
        ),
        SizedBox(height: 44.h),
        CustomElevatedButtonWidget(data: "حفظ",onPressed: (){
          BlocProvider.of<EducationPageCubit>(context).changePage(0);
        },)
      ],
    );
  }
}

