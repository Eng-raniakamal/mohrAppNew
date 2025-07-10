import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/header_home_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/last_salary_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/no_report_widget.dart';
import '../../../../../application/app_prefs.dart';
import '../../../../../application/di.dart';
import '../../../../User/User_viewModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../User/user_view.dart';
import '../../notification/control/tab_notification_cubit.dart';
import '../../notification/presentation/screen/notification_screen.dart';
import '../control/home_cubit.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   static final List<Widget> _body = [
//     userView(),
//     NotificationScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       BlocProvider(
//         create: (context) => HomeCubit(),),
//
//     ], child:  SafeArea(
//      // child: SingleChildScrollView(
//         child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 20.0, vertical: 25).r,
//             child: BlocBuilder<HomeCubit,int>(builder: (context, state) => _body[state],)
//         ),
//      // ),
//     ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  static final List<Widget> _body = [
    userView(),
    NotificationScreen()
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم جدًا عشان التفعيل
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25).r,
          child: BlocBuilder<HomeCubit, int>(
            builder: (context, state) => _body[state],
          ),
        ),
      ),
    );
  }
}
