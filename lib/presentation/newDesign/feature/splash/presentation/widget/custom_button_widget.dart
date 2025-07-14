import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.colorTitle,
    this.icon
  });

  final void Function() onTap;
  final String title;
  final Color? color;
  final Color? colorTitle;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.iBMP14w600Whit.copyWith(color: colorTitle),
          ),
        ),
      ),
    );
  }
}
