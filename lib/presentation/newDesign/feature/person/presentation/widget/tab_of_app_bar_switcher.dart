import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/tab_person_screen_cubit/tab_cubit.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabOfAppBarSwitcher extends StatelessWidget {
   TabOfAppBarSwitcher({super.key});

 final  List<String> tabs = [AppStrings.myData.tr(), AppStrings.Skills.tr(), AppStrings.AcadmicDegree.tr()];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius
            .circular(8)
            .r,
        color: Color(0xffF2F5F9),
      ),
      child: BlocBuilder<TabCubit, int>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length, (index) {
              bool isSelected = index == state;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<TabCubit>(context).changeTab(index);
                },
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primary: null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: AppTextStyle.iBMP14w500.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
// class TabOfAppBarSwitcher extends StatelessWidget {
//   TabOfAppBarSwitcher({super.key});
//
//   final List<String> tabs = [
//     AppStrings.myData.tr(),
//     AppStrings.Skills.tr(),
//     AppStrings.AcadmicDegree.tr(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 208.w,
//       height: 40.h,
//       padding: EdgeInsets.symmetric(horizontal: 8.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8).r,
//         color: const Color(0xffF2F5F9),
//       ),
//       child: BlocBuilder<TabCubit, int>(
//         builder: (context, state) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(tabs.length, (index) {
//               bool isSelected = index == state;
//               return Material(
//                 color: isSelected ? AppColor.primary : Colors.transparent,
//                 borderRadius: BorderRadius.circular(5),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(5),
//                   onTap: () {
//                     context.read<TabCubit>().changeTab(index);
//                   },
//                   child: Container(
//                     height: 32.h,
//                     padding: EdgeInsets.symmetric(horizontal: 5.w),
//                     alignment: Alignment.center,
//                     child: Text(
//                       tabs[index],
//                       style: AppTextStyle.iBMP14w500.copyWith(
//                         color: isSelected ? Colors.white : Colors.black,
//                         fontSize: 12.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           );
//         },
//       ),
//     );
//   }
// }