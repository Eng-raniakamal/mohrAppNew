import 'package:essmohr/presentation/newDesign/core/component/custom_elevated_button_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/vacation_request_widget.dart';

class BodyNoVacationWidget extends StatelessWidget {
  const BodyNoVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(16.r).r,
        border: Border.all(color: context.color.outline),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "لا يوجد أى طلبات أجازة",
              style: context.text.displaySmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            // Text(
            //   "يتم اخد اجازة لاسباب صحية او اضطرارية",
            //   style: context.text.titleMedium,
            // ),
            // Text("فقط", style: context.text.titleMedium),
            // SizedBox(height: 12.h),
            // SizedBox(
            //   width: 150,
            //   child: CustomElevatedButtonWidget(
            //     data: "طلب اجازة",
            //     icon: Icons.add,
            //     onPressed: (){
            //       context.read<VacationCubit>().changeTab(1);
            //
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
