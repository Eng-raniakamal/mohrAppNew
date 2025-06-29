import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class OpeningTimeWidget extends StatelessWidget {
  const OpeningTimeWidget({super.key, this.title, this.color});
  //const OpeningTimeWidget({super.key, required String title, this.Color color});
  final String ? title ;
  final Color? color ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/images/NewDesign/image/home/opening-times.svg"),
        SizedBox(width: 3.w),
        // Text(
        //   //"20 مايو 2024",
        //   style: AppTextStyle.iBMP14w500.copyWith(color: Color(0xff3D4966)),
        // ),
      ],
    );
  }
}
