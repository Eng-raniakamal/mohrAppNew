import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_credits_management_request/tab_credits_management_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/add_management_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/details_item_of_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/tab_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllManagementRequestWidget extends StatelessWidget {
  const AllManagementRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabManagementRequestWidget(),
    TabCreditsManagementRequestWidget(),

    AddManagementRequestWidget(),
    DetailsItemOfRequestWidget()

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: BlocBuilder<TabSwitcherCubit, int>(
        builder: (context, state) {
          return listBody[state];
        },
      ),
    ),);
  }
}











