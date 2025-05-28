
import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign//feature/person/data/skill_model.dart';

import '../../../../../core/utils/app_message.dart';

class ItemSkillWidget extends StatelessWidget {
  const ItemSkillWidget({super.key,
    required this.skillModel});
  static  final IconData _moreVertRounded = IconData(
    0xf8dc,
    fontFamily: 'MaterialIcons',
  );

  final EducationAndSkillModel skillModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 16.0).r,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skillModel.title??"", style: AppTextStyle.iBMP14w700),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      skillModel.isEducation==false?
                      SvgPicture.asset("assets/image/home/opening-times.svg"):
                      SvgPicture.asset("assets/image/person/doc_text.svg"),

                      SizedBox(width: 8.w),
                      Text(skillModel.date??"", style: AppTextStyle.iBMP12w500),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  skillModel.degree!=null? Row(
                    children: [
                      skillModel.isEducation==false?  SvgPicture.asset("assets/image/person/award.svg"):
                      SvgPicture.asset("assets/image/person/doc_page.svg")
                      ,
                      SizedBox(width: 8.w),
                      Text(skillModel.degree??"", style: AppTextStyle.iBMP12w500),
                    ],
                  ):
                  SizedBox.shrink(),
                ],
              ),
              GestureDetector(
                onTap: () {
                  AppMessage. msgFunction(context);
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                  color: Color(0xffF2F5F9),
                    borderRadius: BorderRadius.circular(8).r
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
