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
    return
      GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50.h,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: AppColor.primary,

          ),
          child:Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data,
                style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
              ),
              SizedBox(width: 8.w),
              Icon(icon, color: Colors.white),
            ],
          ) ,
        ),
      );

  }
}