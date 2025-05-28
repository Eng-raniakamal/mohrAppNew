import 'package:essmohr/presentation/newDesign/core/utils/app_image.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImage.logo, width: 60.w, height: 73.h),
        SizedBox(height: 26.h),
        Text("مرحبًا بك👋 في تطبيق مهر!",style: AppTextStyle.iBMP24w700Whit,),
        SizedBox(height: 12.h),
        Text("قم بادخال البريد الالكتروني لتتمكن من تسجيل الدخول", style: AppTextStyle.iBMP16w500,)
      ],
    );
  }
}
