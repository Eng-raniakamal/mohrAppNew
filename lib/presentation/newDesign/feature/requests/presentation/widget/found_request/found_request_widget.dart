import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/data/report_model.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/control/request/request_cubit.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../control/request/request_cubit.dart';
import '../../../control/tab_switcher/tab_switcher_cubit.dart';

class FoundRequestWidget extends StatelessWidget {
  const FoundRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .sizeOf(context)
          .height * .70,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ReportModel.listReport.length,
                  itemBuilder:
                      (context, index) =>
                      ReportWidget(
                        reportModel: ReportModel.listReport[index],
                      ),
                ),
              ),
              SizedBox(height: 75.h),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: GestureDetector(
                  onTap: (){
                    context.read<RequestCubit>().changePage(1);
                    context.read<TabSwitcherCubit>().changeTab(0);
                  },
                  child: Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}