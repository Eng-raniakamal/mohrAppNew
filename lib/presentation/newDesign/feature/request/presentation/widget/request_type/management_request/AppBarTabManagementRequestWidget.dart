import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class AppBarTabManagementRequestWidget extends StatelessWidget {
  const AppBarTabManagementRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today_outlined),
        SizedBox(width: 8.w),
        Text("نوفمبر 2024", style: context.text.titleMedium),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.keyboard_arrow_down_rounded),
        ),
      ],
    );
  }
}
