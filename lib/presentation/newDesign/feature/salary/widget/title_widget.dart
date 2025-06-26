import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, this.title});
  final String ?title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: AppColor.primary,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24).r,
      child: Text(title??"title", style: AppTextStyle.iBMP18w500),
    );
  }
}
