

import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/control/home_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/data/get_alert_api.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/item_notification_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/notification_tab_of_app_bar_switcher.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../resources/routes.dart';
import '../../../../requests/presentation/widget/app_bar_managment_request_widget.dart';

//import '../../../../request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';

class TabEmployeeNotificationWidget extends StatefulWidget {
  const TabEmployeeNotificationWidget({super.key});

  @override
  State<TabEmployeeNotificationWidget> createState() => _TabEmployeeNotificationWidgetState();
}

class _TabEmployeeNotificationWidgetState extends State<TabEmployeeNotificationWidget> {

  final GetAlertData _getAlertData = GetAlertData();

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Container(color: AppColor.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            AppBarManagementRequestWidget(
              title: AppStrings.notifications.tr(),
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.homeRoute);
               // context.read<HomeCubit>().changeScreen(0);
              },
            ),
            SizedBox(height: 36.h),
            Center(child: NotificationTabOfAppBarSwitcher()),
            SizedBox(height: 12.h),
           Expanded(child:getAlertData())
            // ItemNotificationWidget(title: AppStrings.new_message_here.tr(), backGround:AppColor.primary,),
            // SizedBox(height: 8.h),
            // ItemNotificationWidget(title: AppStrings.seen.tr(), backGround:colorTheme.surface,),
            // ItemNotificationWidget( backGround:colorTheme.surface,),

          ],
        ),
      ),
    );
  }

  Widget getAlertData() {
    return FutureBuilder<List<AlertModel>?>(
      future: _getAlertData.getApiAlert(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('حدث خطأ: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد إشعارات'));
        } else {
          final alerts = snapshot.data!;
          // final unseen = alerts.where((n) => n.seen == false).toList();
          // final seen = alerts.where((n) => n.seen == true).toList();

          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              if (alerts.isNotEmpty) ...[
                ...alerts.map((alert) => ItemNotificationWidget(
                  title: '',
                  notificationTitle: alert.link ?? 'بدون عنوان',
                  notificationDescription: alert.content ?? 'بدون تفاصيل',
                  date: '',
                  backGround: AppColor.coolBlue,
                )),
              ],
              // if (seen.isNotEmpty) ...[
              //   const SizedBox(height: 5),
              //   Text(
              //     AppStrings.seen.tr(),
              //     style: Theme.of(context).textTheme.titleLarge,
              //   ),
              //   ...seen.map((notif) => ItemNotificationWidget(
              //     title: '',
              //     notificationTitle: notif.title ?? 'بدون عنوان',
              //     notificationDescription: notif.details ?? 'بدون تفاصيل',
              //     date: _formattingDate(notif.date)?? '',
              //     backGround:  AppColor.softStone,
              //   )),
              // ],
            ],
          );
        }
      },
    );
  }


}

