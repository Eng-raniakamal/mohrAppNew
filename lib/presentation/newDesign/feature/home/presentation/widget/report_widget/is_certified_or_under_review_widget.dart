import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class IsCertifiedOrUnderReviewWidget extends StatelessWidget {
  const IsCertifiedOrUnderReviewWidget({
    super.key,
    this.isCertified,
    this.isUnderReview,
    this.nameReport,
  });

  final bool? isCertified;
  final bool? isUnderReview;
  final String? nameReport;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isCertified == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: Color.fromRGBO(49, 200, 89, .15),
          ),
          child: Text("معتمدة", style: AppTextStyle.iBMP12w500Green),
        )
            : SizedBox(),
        //قيد التدقيق
        isUnderReview == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 215, 5, 0.1),
          ),
          child: Text("قيد التدقيق", style: AppTextStyle.iBMP12w500Orange),
        )
            : SizedBox(),
        SizedBox(width: 3.w),
        Text(nameReport ?? "", style: AppTextStyle.iBMP20w600),
      ],
    );
  }
}
