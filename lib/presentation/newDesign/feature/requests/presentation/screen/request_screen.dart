import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/requests/control/dropdown/dropdown_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/requests/control/request/request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/requests/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/requests/presentation/widget/request_type/request_screen_body.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/all_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/tab_mangement_request/all_management_request_widget.dart';
class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  static final List<Widget> screen = [
    RequestScreenBody(),
   // AllManagementRequestWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DropdownCubit>(create: (context) => DropdownCubit()),
        BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
        BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
      ],
      child: SafeArea(
        child: BlocBuilder<RequestCubit,int>(
            builder: (context,state) {
              return SingleChildScrollView(child: screen[state]);
            }
        ),
      ),
    );
  }
}
