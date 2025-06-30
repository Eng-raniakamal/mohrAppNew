
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/data/skill_model.dart';

import '../../../../../../../application/di.dart';
import '../../../../../../editEmployee/View/empAcademicDegree_view.dart';
import '../../../../../../editEmployee/View/empSkills_view.dart';
import '../../../../../../editEmployee/ViewModel/displayEmpSkills_viewModel.dart';
import '../../../../../core/utils/app_message.dart';
@immutable
class ItemEducationWidget extends StatelessWidget {
  ItemEducationWidget({super.key,});
  static  const IconData _moreVertRounded = IconData(0xf8dc, fontFamily: 'MaterialIcons',);
  List<UserAcademicDegree>? academicDegree;

  var academicDegreeModel;

  //final EducationAndSkillModel skillModel;
  @override
  // Widget build(BuildContext context) {
  //   return  Padding(
  //     padding: const EdgeInsets.only(bottom: 16.0).r,
  //     child: Card(
  //       color: Colors.white,
  //       child: Padding(
  //         padding:
  //         const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8).r,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(academicDegreeModel.typeName??"", style: AppTextStyle.iBMP14w700),
  //                 SizedBox(height: 4.h),
  //                 Row(
  //                   children: [
  //                     academicDegreeModel.isEducation==false?
  //                     SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg"):
  //                     SvgPicture.asset("assets/images/NewDesign/image/person/doc_text.svg"),
  //
  //                     SizedBox(width: 8.w),
  //                     Text(academicDegreeModel.degreeDate??"", style: AppTextStyle.iBMP14w500),
  //                   ],
  //                 ),
  //                 SizedBox(height: 4.h),
  //                 academicDegreeModel.gradeName!=null? Row(
  //                   children: [
  //                     academicDegreeModel.isEducation==false?  SvgPicture.asset("assets/images/NewDesign/image/person/award.svg"):
  //                     SvgPicture.asset("assets/images/NewDesign/image/person/doc_page.svg")
  //                     ,
  //                     SizedBox(width: 8.w),
  //                     Text(academicDegreeModel.gradeName??"", style: AppTextStyle.iBMP14w500),
  //                   ],
  //                 ):
  //                 SizedBox.shrink(),
  //               ],
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 AppMessage. msgFunction(context);
  //               },
  //               child: Container(
  //                 width: 30.w,
  //                 height: 30.h,
  //                 decoration: BoxDecoration(
  //                     color: Color(0xffF2F5F9),
  //                     borderRadius: BorderRadius.circular(8).r
  //                 ),
  //                 child: Icon(_moreVertRounded),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // حماية: إذا كانت البيانات null، اعرض عنصر فارغ
    // if (academicDegreeModel == null) {
    //   return const SizedBox.shrink();
    // }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0).r,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(academicDegreeModel.typeName ?? "", style: AppTextStyle.iBMP14w700),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      academicDegreeModel.isEducation == false
                          ? SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg")
                          : SvgPicture.asset("assets/images/NewDesign/image/person/doc_text.svg"),
                      SizedBox(width: 8.w),
                      Text(academicDegreeModel.degreeDate ?? "", style: AppTextStyle.iBMP14w500),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  if (academicDegreeModel.gradeName != null)
                    Row(
                      children: [
                        academicDegreeModel.isEducation == false
                            ? SvgPicture.asset("assets/images/NewDesign/image/person/award.svg")
                            : SvgPicture.asset("assets/images/NewDesign/image/person/doc_page.svg"),
                        SizedBox(width: 8.w),
                        Text(academicDegreeModel.gradeName!, style: AppTextStyle.iBMP14w500),
                      ],
                    ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AppMessage.msgFunction(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F5F9),
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                  child: Icon(_moreVertRounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
