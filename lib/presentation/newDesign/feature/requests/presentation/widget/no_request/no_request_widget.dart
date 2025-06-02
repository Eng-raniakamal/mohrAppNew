
import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/component/custom_elevated_button_widget.dart';
import '../../../../../core/utils/import_file.dart';
import '../../../control/request/request_cubit.dart';
import '../../../control/tab_switcher/tab_switcher_cubit.dart';

class NoRequestWidget extends StatelessWidget {
  const NoRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 215.h,
          padding: EdgeInsets.symmetric(horizontal: 10).r,
          decoration: BoxDecoration(
            border: Border.all(color: context.color.outline),
            borderRadius: BorderRadius.circular(8).r,
            color: context.color.surface,
          ),
          child: Center(
            child: SizedBox(
              width: 257.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا يوجد اي طلبات",
                    style: AppTextStyle.iBMP24w600Black.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "يتم اخد اجازة لاسباب صحية او اضطرارية ",
                    style: context.text.titleMedium,
                  ),
                  Text("فقط", style: context.text.titleMedium),
                  SizedBox(height: 12.h),
                  CustomElevatedButtonWidget(
                    onPressed: () {
                      context.read<RequestCubit>().changePage(1);
                      context.read<TabSwitcherCubit>().changeTab(0);
                    },
                    data: "طلب جديد",
                    icon: Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}