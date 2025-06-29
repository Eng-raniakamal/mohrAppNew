import '../../feature/layout/export_layout_file.dart';

class CustomTitleAndValueWidget extends StatelessWidget {
  const CustomTitleAndValueWidget({super.key, required this.title, required this.value});
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(  title??"عنوان", style: textTheme.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: AppColor.lightBlueBg,
          ),
          child: Text(
            " ${value ?? "قيمة"}",
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
