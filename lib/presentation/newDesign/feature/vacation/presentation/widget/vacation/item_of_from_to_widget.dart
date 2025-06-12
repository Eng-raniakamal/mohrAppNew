import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class ItemOfFromToWidget extends StatelessWidget {
  final String title;
  final String date;

  const ItemOfFromToWidget({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        border: Border.all(color: context.color.outline),
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.text.titleSmall),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 20.r,
                color: context.color.shadow,
              ),
              SizedBox(width: 8.w),
              Text(date, style: context.text.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
