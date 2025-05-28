import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';

import '../../../../../../application/constants.dart';
import 'notification_icon_widget.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text(AppStrings.home.tr(), style: AppTextStyle.iBMP24w600),
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.Welcome.tr(), style: AppTextStyle.iBMP12w500),
                Text(",", style: AppTextStyle.iBMP12w500),
                Text(title, style: AppTextStyle.iBMP12w500.copyWith(
                    color: Color(0xff0958D9)
                )),
              ],
            )
          ],
        ),
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r,
            color: Color(0xffFF9600),
          ),
          child: NotificationIconWidget()
          //Icon(Icons.notifications_none, color: Colors.white),
         //    child: Stack(
         //      children: [
         //        Icon(Icons.notifications_none, color: Colors.white),
         //        Positioned(
         //          right: 0,
         //          top: 0,
         //          child: AnimatedSwitcher(
         //            duration: Duration(milliseconds: 300),
         //            transitionBuilder: (child, animation) => ScaleTransition(
         //              scale: animation,
         //              child: child,
         //            ),
         //            child: Constants.notificationNumber  > 0
         //                ? Container(
         //              key: ValueKey<int>(Constants.notificationNumber),
         //              padding: EdgeInsets.all(2),
         //              decoration: BoxDecoration(
         //                color: Colors.red,
         //                shape: BoxShape.circle,
         //              ),
         //              constraints: BoxConstraints(
         //                minWidth: 16,
         //                minHeight: 16,
         //              ),
         //              child: Text(
         //                '$Constants.notificationNumber',
         //                style: TextStyle(
         //                  color: Colors.white,
         //                  fontSize: 10,
         //                ),
         //                textAlign: TextAlign.center,
         //              ),
         //            )
         //                : SizedBox.shrink(), // Hide badge if 0
         //          ),
         //        ),
         //      ],
         //    )
        ),
      ],
    );
  }
}
