import '../utils/import_file.dart';

class CustomFromToDateWidget extends StatelessWidget {
  const CustomFromToDateWidget({super.key, required this.title, required this.date});

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8).r,
            color: context.color.onPrimaryContainer,
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: context.color.surfaceContainer,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(
                " ${date ?? "تاريخ اليوم"}",
                style: context.text.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
