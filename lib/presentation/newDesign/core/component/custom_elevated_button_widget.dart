import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key, this.onPressed, required this.data, this.icon,
  });
  final void Function()? onPressed;
  final String data;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data,
            style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
          ),
          SizedBox(width: 8.w),
          Icon(icon, color: Colors.white),
        ],
      ),
    );
  }
}
