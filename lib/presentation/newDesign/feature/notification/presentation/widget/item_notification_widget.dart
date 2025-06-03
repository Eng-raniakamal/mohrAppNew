import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class ItemNotificationWidget extends StatelessWidget {
   ItemNotificationWidget({
    super.key,
    this.title,
    this.backGround,
    required this.notificationTitle,
    required this.notificationDescription,
    required this.date,
  });

  final String? title; // عنوان عام للجزء (مثل: "الإشعارات")
  final Color? backGround;

  final String notificationTitle;      // عنوان الإشعار
  final String notificationDescription; // وصف الإشعار
  final String date;                    // التاريخ


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
          //SizedBox(height: 1.h),
        ],
        ):
        SizedBox.shrink(),
       // SizedBox(height: 2),

        Container(
          margin: EdgeInsets.only(
            bottom: 1.h,
         ).r,
          padding: EdgeInsets
              .all(6)
              .r,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backGround ?? colorTheme.onPrimaryFixed,
            borderRadius: BorderRadius
                .circular(12)
                .r,
            border: Border.all(color: colorTheme.outline),
          ),
          child:
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         SizedBox(height: 2.h),
          //         Text(
          //           notificationTitle,
          //           style: textTheme.titleMedium?.copyWith(
          //             fontWeight: FontWeight.w600,
          //             color:AppColor.primaryBlue,
          //           ),
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         SizedBox(height: 2.h),
          //         Text(
          //           notificationDescription,
          //           style: textTheme.bodyLarge,
          //           maxLines: 4,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         SizedBox(height: 2.h),
          //         Text(date, style: textTheme.labelSmall),
          //       ],
          //     ),
          //
          //     Icon(Icons.arrow_forward),
          //   ],
          // ),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationTitle,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryBlue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      notificationDescription,
                      style: textTheme.bodyLarge,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Text(date, style: textTheme.labelSmall),
                  ],
                ),
              ),

              SizedBox(
                width: 24,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward_ios, // أو back_ios حسب RTL
                    size: 20,
                  ),
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}