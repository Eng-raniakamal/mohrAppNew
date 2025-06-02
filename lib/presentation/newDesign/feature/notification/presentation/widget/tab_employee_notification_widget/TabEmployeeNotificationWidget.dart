

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/control/home_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/item_notification_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/notification_tab_of_app_bar_switcher.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../requests/presentation/widget/app_bar_managment_request_widget.dart';

//import '../../../../request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';

class TabEmployeeNotificationWidget extends StatelessWidget {
  const TabEmployeeNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Container(color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36.h),
          AppBarManagementRequestWidget(
            title: AppStrings.notifications.tr(),
            icon: Icons.arrow_back,
            onTap: () {
              context.read<HomeCubit>().changeScreen(0);
            },
          ),
          SizedBox(height: 36.h),
          Center(child: NotificationTabOfAppBarSwitcher()),
          SizedBox(height: 12.h),
          ItemNotificationWidget(title: AppStrings.new_message_here.tr(), backGround:colorTheme.onPrimaryContainer,),
          SizedBox(height: 8.h),
          ItemNotificationWidget(title: AppStrings.seen.tr(), backGround:colorTheme.surface,),
          ItemNotificationWidget( backGround:colorTheme.surface,),

        ],
      ),
    );
  }
}