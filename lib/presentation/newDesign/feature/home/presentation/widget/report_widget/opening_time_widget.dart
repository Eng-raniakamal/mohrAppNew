import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class OpeningTimeWidget extends StatelessWidget {
  const OpeningTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg"),
        SizedBox(width: 3.w),
        Text(
          "20 مايو 2024",
          style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
        ),
      ],
    );
  }
}
