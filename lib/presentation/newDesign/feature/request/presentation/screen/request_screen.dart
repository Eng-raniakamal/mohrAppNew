import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/dropdown/dropdown_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/request/request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_screen_body.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/all_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/appbarstart.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  static final List<Widget> screen = [
    RequestScreenBody(),
    AllManagementRequestWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider<DropdownCubit>(create: (context) => DropdownCubit()),
    //     BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
    //     BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
    //   ],
    //   child: SafeArea(
    //     child: BlocBuilder<RequestCubit,int>(
    //       builder: (context,state) {
    //         return SingleChildScrollView(child: screen[state]);
    //       }
    //     ),
    //   ),
    // );

    return Scaffold(
        appBar: buildAppBarstart(context),
        // leading: BackButton(onPressed: ()=>Navigator.pop(context),),
        // title: const Text('Second Route')),
        body:Center(
            child: Container(color: Colors.white,
                child: Image.asset("assets/images/44190-under-construction-1 (1).gif"))
        ))
    ;
  }
}

