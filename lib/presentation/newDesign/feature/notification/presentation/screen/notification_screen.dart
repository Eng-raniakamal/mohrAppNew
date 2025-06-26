
import 'package:essmohr/presentation/newDesign/feature/home/control/home_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/notification/presentation/widget/tab_all_notification_widget/tab_all_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../control/tab_notification_cubit.dart';
import '../widget/tab_employee_notification_widget/TabEmployeeNotificationWidget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static final List<Widget> listBody = [
    TabAllNotificationWidget(),
    TabEmployeeNotificationWidget(),
  ];

  @override
  // Widget build(BuildContext context) {
  //   return
  //
  //     BlocBuilder<TabNotificationCubit, int>(
  //     builder: (context, state) => listBody[state],
  //   );
  // }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabNotificationCubit>(
          create: (_) => TabNotificationCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(),
        ),
      ],
      child: BlocBuilder<TabNotificationCubit, int>(
        builder: (context, state) => listBody[state],
      ),
    );
  }


}