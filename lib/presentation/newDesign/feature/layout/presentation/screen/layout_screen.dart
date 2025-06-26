import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/screen/vacation_screen.dart';

import '../../../../../Requests/Salary/View/salary_View.dart';
import '../../../notification/presentation/screen/notification_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required int initialIndex});

  final List<Widget> listScreen = const [
    HomeScreen(),
    NotificationScreen(),
    //RequestScreen(),
    VacationScreen() ,
    salaryView(),
    PersonScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: SafeArea(child: listScreen[currentIndex]),
            bottomNavigationBar:CustomBottomNavigationBarWidget()
          );
        },
      ),
    );
  }

}





