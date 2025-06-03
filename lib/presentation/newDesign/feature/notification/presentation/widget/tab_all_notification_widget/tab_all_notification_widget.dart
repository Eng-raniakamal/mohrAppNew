import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
//import 'package:essmohr/presentation/newDesign/feature/home/control/home_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/item_notification_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/notification_tab_of_app_bar_switcher.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../domain/model/model.dart';
import '../../../../../../resources/routes.dart';
import '../../../../home/control/home_cubit.dart';
import '../../../../requests/presentation/widget/app_bar_managment_request_widget.dart';
import '../../../data/get_notification_api.dart';

//import '../../../../request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';

class TabAllNotificationWidget extends StatefulWidget {
  const TabAllNotificationWidget({super.key});

  @override
  State<TabAllNotificationWidget> createState() => _TabAllNotificationWidgetState();
}

class _TabAllNotificationWidgetState extends State<TabAllNotificationWidget> {
  final GetNotificationData _getNotificationData = GetNotificationData();

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme
        .of(context)
        .colorScheme;
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Container(color: AppColor.white,

      child:Padding(
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
                //context.read<HomeCubit>().changeScreen(0);
              },
            ),

            SizedBox(height: 36.h),
            Center(child: NotificationTabOfAppBarSwitcher()),
            SizedBox(height: 12.h),
            Expanded(child: getNotificationData())
          //  ItemNotificationWidget(title: AppStrings.new_message_here.tr(), backGround:AppColor.primary, notificationTitle: '', notificationDescription: '', date: '',),
           // SizedBox(height: 8.h),
            //"تم قراتها سابقاً"
          //  ItemNotificationWidget(title: AppStrings.seen.tr(), backGround:colorTheme.surface, notificationTitle: '', notificationDescription: '', date: '',),
           // ItemNotificationWidget( backGround:colorTheme.surface,),
          ],
        ),
      ),
    );
  }






  // Widget getNotificationData() {
  //   return Expanded( // 🔁 هذا هو التعديل المهم
  //     child: FutureBuilder<List<NotificationModel>?>(
  //       future: _getNotificationData.getApiNotification(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('حدث خطأ: ${snapshot.error}'));
  //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //           return const Center(child: Text('لا توجد إشعارات'));
  //         } else {
  //           final notifications = snapshot.data!;
  //
  //           return ListView.builder(
  //             itemCount: notifications.length,
  //             itemBuilder: (context, index) {
  //               final notif = notifications[index];
  //
  //               return Column(
  //                 children: [
  //                   ItemNotificationWidget(
  //                     title: notif.seen == false
  //                         ? AppStrings.new_message_here.tr()
  //                         : AppStrings.seen.tr(),
  //                     notificationTitle: notif.title ?? 'بدون عنوان',
  //                     notificationDescription: notif.details ?? 'بدون تفاصيل',
  //                     date: notif.date ?? '',
  //                   ),
  //                   SizedBox(height: 8.h),
  //                 ],
  //               );
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget getNotificationData() {
    return FutureBuilder<List<NotificationModel>?>(
      future: _getNotificationData.getApiNotification(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('حدث خطأ: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد إشعارات'));
        } else {
          final notifications = snapshot.data!;
          final unseen = notifications.where((n) => n.seen == false).toList();
          final seen = notifications.where((n) => n.seen == true).toList();

          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              if (unseen.isNotEmpty) ...[
                Text(
                  AppStrings.new_message_here.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
               //const SizedBox(height: 8),
                ...unseen.map((notif) => ItemNotificationWidget(
                  title: '',
                  notificationTitle: notif.title ?? 'بدون عنوان',
                  notificationDescription: notif.details ?? 'بدون تفاصيل',
                  date:_formattingDate(notif.date) ?? '',
                  backGround: AppColor.coolBlue,
                )),
              ],
              if (seen.isNotEmpty) ...[
               const SizedBox(height: 5),
                Text(
                  AppStrings.seen.tr(),
        style: Theme.of(context).textTheme.titleLarge,
                ),
                ...seen.map((notif) => ItemNotificationWidget(
                  title: '',
                  notificationTitle: notif.title ?? 'بدون عنوان',
                  notificationDescription: notif.details ?? 'بدون تفاصيل',
                  date: _formattingDate(notif.date)?? '',
                  backGround:  AppColor.softStone,
                )),
              ],
            ],
          );
        }
      },
    );
  }


  String? _formattingDate(String? date) {
    if (date != null) {
      String? formattingDate = date.split('T').first;
      return formattingDate;
    }
    return null;
  }

}


