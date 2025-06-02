
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/import_file.dart';
import '../../control/tab_notification_cubit.dart';

class NotificationTabOfAppBarSwitcher extends StatelessWidget {
  NotificationTabOfAppBarSwitcher({super.key});

  final List<String> tabs = [AppStrings.notifications.tr(),AppStrings.alerts.tr()];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius
            .circular(8)
            .r,
        color: Color(0xffF2F5F9),
      ),
      child: BlocBuilder<TabNotificationCubit, int>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length, (index) {
              bool isSelected = index == state;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<TabNotificationCubit>(context).changeTab(index);
                },
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.lightBlue : null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: AppTextStyle.iBMP12w500MidnightBlue.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}