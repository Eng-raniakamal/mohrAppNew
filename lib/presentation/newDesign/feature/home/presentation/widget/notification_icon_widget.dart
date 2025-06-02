import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../application/app_prefs.dart';
import '../../../../../../application/constants.dart';
import '../../../../../../application/di.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/routes.dart';
import '../../../notification/control/tab_notification_cubit.dart';
import '../../../notification/presentation/screen/notification_screen.dart';

class NotificationIconWidget extends StatefulWidget {
  const NotificationIconWidget({
    super.key,
  });

  @override
  State<NotificationIconWidget> createState() => _NotificationIconWidgetState();
}

class _NotificationIconWidgetState extends State<NotificationIconWidget> {

  final AppPreferences _appPreferences = instance<AppPreferences>();
   int notificationNum=0;

  @override
  void initState() {
    init();
    super.initState();

  }

  Future init()
  async {
    notificationNum =await _appPreferences.getUserNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    if (notificationNum == 0) {
      return Icon(
          Icons.notifications_none, size: 45, color: colorManager.white);
    }
    else {
      return Stack(
        children: [
          IconButton(onPressed: () {
            Constants.notificationNumber=0;
            _appPreferences.setUserNotificationList(0);


            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => TabNotificationCubit(),
                  child: NotificationScreen(),
                ),
              ),
            );

           // Navigator.of(context).pushNamed(Routes.notification);
      },
              icon:  Icon(Icons.notifications_none, size: 40, color: colorManager.white)),
          //Icon(Icons.notifications_none, size: 45, color: colorManager.white),
          Positioned(
            right: 3,
            top:0,
            child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(7),
                ),
                constraints:  BoxConstraints(
                  minWidth: 11,
                  minHeight: 11,
                ),
                child:
                Text(
                  '$notificationNum',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )

            ),
          ),
          //)
        ],
      );
    }
  }
}
