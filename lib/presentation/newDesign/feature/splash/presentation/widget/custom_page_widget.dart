import 'package:essmohr/presentation/newDesign/core/utils/app_image.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/feature/onboarding/data/page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageWidget extends StatelessWidget {
  const CustomPageWidget({super.key, required this.pageModel});

  final PageModel pageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(pageModel.image, height: 312.h, width: 403.w),
        SizedBox(height: 52.h),
        Image.asset(AppImage.logo, width: 47.w, height: 62.h),
        SizedBox(height: 24.h),
        Text(
          pageModel.title,
          style: AppTextStyle.iBMP38w700,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        Text(
          pageModel.desc,
          style: AppTextStyle.iBMP16w500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
