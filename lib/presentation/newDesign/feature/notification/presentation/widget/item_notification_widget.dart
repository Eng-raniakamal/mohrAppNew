import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class ItemNotificationWidget extends StatelessWidget {
  const ItemNotificationWidget({super.key, this.title, this.backGround});

  final String?title;
  final Color?backGround;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        title!=null?
        Column(children: [Text(
          title??"",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
          SizedBox(height: 12.h),],):SizedBox.shrink(),


        Container(
          margin: EdgeInsets.only(
            bottom: 12.h,
          ).r,
          padding: EdgeInsets
              .all(12)
              .r,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backGround ?? colorTheme.onPrimaryFixed,
            borderRadius: BorderRadius
                .circular(12)
                .r,
            border: Border.all(color: colorTheme.outline),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    "برجاء تسليم وثيقة التآمين الطبي",
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorTheme.onPrimary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "هنا يتم كتابة وصف عن الاشعار ",
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(height: 6.h),
                  Text("20 May 2024 ", style: textTheme.labelSmall),
                ],
              ),

              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }
}