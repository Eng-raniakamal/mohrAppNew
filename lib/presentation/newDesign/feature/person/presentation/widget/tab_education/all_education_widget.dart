import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../../../../../../domain/model/model.dart';
import '../../../control/education_page/education_cubit.dart';
import '../tab_education_r/item_education_widget.dart';


class AllEducationWidget extends StatefulWidget {
  const AllEducationWidget({super.key});

  @override
  State<AllEducationWidget> createState() => _AllEducationWidgetState();
}

class _AllEducationWidgetState extends State<AllEducationWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "الدرجة العلمية",subTitle: ""
         // subTitle: "الترتيب حسب",
        ),
        SizedBox(height: 16.h),

        ItemEducationWidget(),
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: EducationAndSkillModel.listEducation.length,
        //   itemBuilder: (context, index) {
        //     return ItemEducationWidget(academicDegreeModel: null,);
        //
        //     //return ItemSkillWidget(skillModel: EducationAndSkillModel.listEducation[index]);
        //   },
        // ),

        CustomElevatedButtonWidget(
          icon: Icons.add,
          data: "أضف",
          onPressed: () {
            if (!Constants.allowEdit) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("هذا الموظف لا يمكنه أضافة درجة علمية له"),
                  duration: Duration(seconds: 4),
                )
              );
             // showToast("هذا الموظف لا يمكنه أضافة مهارة جديدة له");
              return;
            }
            BlocProvider.of<EducationPageCubit>(context).changePage(1);
          },
        ),
      ],
    );
  }
}





