import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/generated/assets.dart';

class VacationYearCurrentWidget extends StatelessWidget {
  const VacationYearCurrentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18).r,
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(16.r).r,
        border: Border.all(color: context.color.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14.h),
          Text("رصيد السنة الحالي", style: context.text.headlineSmall),
          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 91.h,
                width: 170.w,
                decoration: BoxDecoration(
                  color: AppColor.backGroundWhite,
                  borderRadius: BorderRadius.circular(16.r).r,
                  border: Border.all(color: context.color.outline),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16).h,
                child: Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      color: context.color.primaryFixedDim,
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(" 24يوم", style: context.text.displayMedium),
                        SizedBox(height: 5.h),
                        Text(" الرصيد الكلي", style: context.text.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 91.h,
                width: 170.w,
                decoration: BoxDecoration(
                  color: AppColor.backGroundWhite,
                  borderRadius: BorderRadius.circular(16.r).r,
                  border: Border.all(color: context.color.outline),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16).h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.homeWaveIcon,
                          width: 12.w,
                          height: 12.h,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          " الرصيد الحالي | 20 يوم",
                          style: context.text.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.homeWithdrawalsIcon,
                          width: 12.w,
                          height: 12.h,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          " الرصيد المرحل |  20 يوم",
                          style: context.text.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h, width: 1),
        ],
      ),
    );
  }
}
