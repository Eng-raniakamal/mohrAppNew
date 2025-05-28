import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/header_report_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/is_certified_or_under_review_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/opening_time_widget.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    super.key,
    this.typeReport,
    this.nameReport,
    this.not,
    this.isRequestAdvance,
    this.isSickLeave,
    this.isCertified,
    this.isUnderReview,
    this.numberOfInstallments=0,
    this.amount=0,
  });

  final String? typeReport; //نوع التقرير سلفه - اجازة
  final String? nameReport; // عنوان الطلب
  final String? not;
  final bool? isRequestAdvance;
  final bool? isSickLeave;
  final bool? isCertified; //معتمده
  final bool? isUnderReview; //تحت التدقيق
  final int? numberOfInstallments;//عدد الأقساط
  final int? amount;// الرصيد

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //نوع الطلب
        HeaderReportWidget(typeReport: typeReport),
        SizedBox(height: 12.h),
        Container(
          // height: 150.h,
          padding: EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: Colors.black12, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // معتمده - تحت الطلب - التاريخ
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IsCertifiedOrUnderReviewWidget(
                    isCertified: isCertified,
                    isUnderReview: isUnderReview,
                    nameReport: nameReport,
                  ),
                  OpeningTimeWidget(),
                ],
              ),
              SizedBox(height: 12.h),
              //عدد الاقساط
              Container
                (
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8).r,
                decoration: BoxDecoration(
                  color:isSickLeave==true? Color(0xffEDF5FF):null,
                  borderRadius: BorderRadius.circular(8).r
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        isRequestAdvance == true
                            ? SvgPicture.asset(
                              "assets/images/NewDesign/image/home/money-bills.svg",
                            )
                            : SizedBox(),

                        isSickLeave == true
                            ? SvgPicture.asset(
                          "assets/images/NewDesign/image/home/withdrawals_icon.svg",
                        )
                            : SizedBox(),
                        SizedBox(width: 5.w),
                        isRequestAdvance == true?
                        Text(" عدد الاقساط :$numberOfInstallments", style: AppTextStyle.nun14w400):SizedBox(),
                        isSickLeave == true?
                        Text("مسحوبات الرصيد | $numberOfInstallments", style: AppTextStyle.nun14w400):SizedBox(),
                        SizedBox(width: 32.w),
                        isRequestAdvance == true?
                        SvgPicture.asset("assets/images/NewDesign/image/home/money-bill.svg"):SizedBox(),
                        SizedBox(width: 5.w),
                        isRequestAdvance == true?
                        Text("$amount\$", style: AppTextStyle.nun14w400):SizedBox(),
                        isSickLeave == true?
                        SvgPicture.asset("assets/images/NewDesign/image/home/wave_icon.svg"):SizedBox(),
                        SizedBox(width: 5.w),
                        isSickLeave == true?
                        Text("الرصيد المتاح| $amount", style: AppTextStyle.nun14w400):SizedBox(),
                      ],

                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text("ملاحظات", style: AppTextStyle.iBMP12w600),
              SizedBox(height: 6.h),

              Text(
               not??"لا يوجد ملاحظات مضافة ",
                style: AppTextStyle.iBMP16w500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


