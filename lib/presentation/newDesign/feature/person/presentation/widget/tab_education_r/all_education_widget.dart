
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/editEmployee/View/empAcademicDegree_view.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpAcademicDegree_ViewModel.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/education_page/education_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/data/skill_model.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_skill/item_skill_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../editEmployee/ViewModel/Degree_viewModel.dart';
import '../../../../../../editEmployee/ViewModel/grade_viewModel.dart';
import '../../../control/skill_page/skill_page_cubit.dart';
import 'education_data_widget.dart';
import 'item_education_widget.dart';


class AllEducationWidget extends StatefulWidget {
  const AllEducationWidget({super.key});

  @override
  State<AllEducationWidget> createState() => _AllEducationWidgetState();
}

class _AllEducationWidgetState extends State<AllEducationWidget> {



  final DisplayAcademicDegreeViewModel _displayViewModel=instance<DisplayAcademicDegreeViewModel>();
  //final SaveAcademicDegreeViewModel _saveviewModel=instance<SaveAcademicDegreeViewModel>();

  final GradeViewModel _GradeviewModel = instance<GradeViewModel>();
  final DegreeViewModel _DegreeviewModel = instance<DegreeViewModel>();

  DateTime date= DateTime(2022);


  final TextEditingController _DateEditingController= TextEditingController();
  final TextEditingController _GradeIdEditingController=TextEditingController();

  final TextEditingController _EmployeeIdEditingController=TextEditingController();

  String? userId;
  List<UserAcademicDegree>? academicDegree;

  bool? allowEdit;


  @override
  void initState() {

    super.initState();
    _displayViewModel.start();
    _blind();
    setState(() {
      academicDegree;
    });
  }
  @override
  void dispose() {
   // _displayViewModel.dispose();
    super.dispose();
  }

  _blind() {

    _displayViewModel.start();
    _GradeviewModel.start();
    _DegreeviewModel.start();
    _DateEditingController.addListener(() {

    });
    _GradeIdEditingController.addListener(() {

    });

    _EmployeeIdEditingController.addListener(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderCoreWidget(title: "الدرجة العلمية", subTitle: "",),
        //subTitle: "الترتيب حسب",),
        SizedBox(height: 16.h),
        StreamBuilder<getAcademicDegreeModel>(
            stream: _displayViewModel.outputAcademicDegree,
            builder: (context, snapshot) {
              allowEdit = snapshot.data?.allowEdit;


              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.academicDegree?.length,
                itemBuilder: (context, index) {
                  //return ItemEducationWidget(academicDegreeModel: snapshot.data?.academicDegree?[index]);

                },
              );
            }
        ),


        CustomElevatedButtonWidget(
          icon: Icons.add,
          data: AppStrings.Add.tr(),
          onPressed: () {
            if (!allowEdit!) {
              showToast("هذا الموظف لا يمكنه أضافة درجه علمية");
              return;
            }
           // BlocProvider.of<SkillPageCubit>(context).changePage(0);
            BlocProvider.of<EducationPageCubit>(context).changePage(2);
          },
        ),

      ],
    );
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }
}







