import 'dart:developer';

import 'package:essmohr/presentation/newDesign/core/component/header_core_widget.dart';
import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/depend_inject.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/tab_all_vacation/item_tab_all_vacation_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../control/get_employee_vacations/vacation_entitlement_cubit.dart';
import '../../no_vacation_widget/no_vacation_widget.dart';

// class TabAllVacationWidget extends StatelessWidget {
//   const TabAllVacationWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<GetEmployeeVacationsCubit>()..getEmployeeVacations(),
//       child: Column(
//         children: [
//           HeaderCoreWidget(title: "جميع الاجازات",subTitle:""),
//               //subTitle: "الترتيب حسب"),
//           SizedBox(height: 12.h),
//           BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
//             builder: (context, state) {
//             List response=  state.response?? [];
//               if (state.isLoading==true) {
//                 return  Center(child: Column(
//                   children: [
//                     SizedBox(height: context.height * 0.25,),
//                     CircularProgressIndicator(),
//                   ],
//                 ));
//               }
//               if (state.errorMessage?.isNotEmpty?? false) {
//                 return Center(child: Text(state.errorMessage??"Error"));
//               }
//               return Column(
//                 children:
//                 response
//                     .map(
//                       (e) =>
//                       GestureDetector(
//                         onTap: () {
//                           context.read<VacationCubit>().changeTab(3);
//                           context.read<VacationCubit>().setEmployeeVacationsModel(e);
//                           log("AAA");
//                         },
//                         child: ItemTabAllVacationWidget(employeeVacationsModel: e),
//                       ),
//                 )
//                     .toList(),
//               );
//             },
//           ),
//           Align(
//             alignment: AlignmentDirectional.bottomEnd,
//             child: GestureDetector(
//               onTap: () {
//                 context.read<VacationCubit>().changeTab(1);
//                 log("ccc");
//               },
//               child: Container(
//                 width: 60.w,
//                 height: 60.h,
//                 decoration: BoxDecoration(
//                   color: AppColor.primary,
//                   borderRadius: BorderRadius.circular(12).r,
//                 ),
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TabAllVacationWidget extends StatelessWidget {
//   const TabAllVacationWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<GetEmployeeVacationsCubit>()..getEmployeeVacations(),
//       child: Column(
//         children: [
//           HeaderCoreWidget(title: "جميع الاجازات", subTitle: ""),
//           SizedBox(height: 12.h),
//           BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
//             builder: (context, state) {
//               List response = state.response ?? [];
//
//               if (state.isLoading == true) {
//                 return Center(
//                   child: Column(
//                     children: [
//                       SizedBox(height: context.height * 0.25),
//                       CircularProgressIndicator(),
//                     ],
//                   ),
//                 );
//               }
//
//               if (state.errorMessage?.isNotEmpty ?? false) {
//                 return Center(child: Text(state.errorMessage ?? "Error"));
//               }
//
//               if (response.isEmpty) {
//                 return const NoVacationWidget();
//               }
//
//               return Column(
//                 children: response
//                     .map(
//                       (e) => GestureDetector(
//                     onTap: () {
//                       context.read<VacationCubit>().changeTab(3);
//                       context.read<VacationCubit>().setEmployeeVacationsModel(e);
//                       log("AAA");
//                     },
//                     child: ItemTabAllVacationWidget(employeeVacationsModel: e),
//                   ),
//                 )
//                     .toList(),
//               );
//             },
//           ),
//           SizedBox(height: 30,),
//           Align(
//             alignment: AlignmentDirectional.bottomEnd,
//             child: GestureDetector(
//               onTap: () {
//                 context.read<VacationCubit>().changeTab(1);
//                 log("ccc");
//               },
//               child: Container(
//                 width: 60.w,
//                 height: 60.h,
//                 decoration: BoxDecoration(
//                   color: AppColor.primary,
//                   borderRadius: BorderRadius.circular(12).r,
//                 ),
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class TabAllVacationWidget extends StatelessWidget {
//   const TabAllVacationWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<GetEmployeeVacationsCubit>();
//
//     // حمّل البيانات فقط إذا كانت فارغة أو لم تُحمّل بعد
//     if ((cubit.state.response?.isEmpty ?? true) && !cubit.state.isLoading!) {
//       cubit.getEmployeeVacations();
//     }
//
//     return Column(
//       children: [
//         HeaderCoreWidget(title: "جميع الاجازات", subTitle: ""),
//         SizedBox(height: 12.h),
//         BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
//           builder: (context, state) {
//             final response = state.response ?? [];
//
//             if (state.isLoading!) {
//               return SizedBox(
//                 height: context.height * 0.5,
//                 child: const Center(child: CircularProgressIndicator()),
//               );
//             }
//
//             if (state.errorMessage?.isNotEmpty ?? false) {
//               return Center(child: Text(state.errorMessage ?? "حدث خطأ"));
//             }
//
//             if (response.isEmpty) {
//               return const NoVacationWidget();
//             }
//
//             return ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: response.length,
//               separatorBuilder: (_, __) => SizedBox(height: 8.h),
//               itemBuilder: (_, index) {
//                 final e = response[index];
//                 return GestureDetector(
//                   onTap: () {
//                     context.read<VacationCubit>().changeTab(3);
//                     context.read<VacationCubit>().setEmployeeVacationsModel(e);
//                   },
//                   child: ItemTabAllVacationWidget(employeeVacationsModel: e, vacationBalances: [],),
//                 );
//               },
//             );
//           },
//         ),
//         SizedBox(height: 30),
//         Align(
//           alignment: AlignmentDirectional.bottomEnd,
//           child: GestureDetector(
//             onTap: () {
//               context.read<VacationCubit>().changeTab(1);
//             },
//             child: Container(
//               width: 60.w,
//               height: 60.h,
//               decoration: BoxDecoration(
//                 color: AppColor.primary,
//                 borderRadius: BorderRadius.circular(12).r,
//               ),
//               child: const Icon(Icons.add, color: Colors.white, size: 30),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
class TabAllVacationWidget extends StatelessWidget {
  const TabAllVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetEmployeeVacationsCubit>();

    // تحميل بيانات الإجازات إن لم تكن محمّلة
    if ((cubit.state.response?.isEmpty ?? true) && !cubit.state.isLoading!) {
      cubit.getEmployeeVacations();
    }

    return Column(
      children: [
        HeaderCoreWidget(title: "جميع الاجازات", subTitle: ""),
        SizedBox(height: 12.h),
        BlocBuilder<GetEmployeeVacationsCubit, GetEmployeeVacationsState>(
          builder: (context, state) {
            final response = state.response ?? [];

            if (state.isLoading!) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            if (state.errorMessage?.isNotEmpty ?? false) {
              return Center(child: Text(state.errorMessage ?? "حدث خطأ"));
            }

            if (response.isEmpty) {
              return const NoVacationWidget();
            }

            // نحصل على بيانات الرصيد من الكيوبت الخاص بها
            final vacationBalances =
                context.watch<VacationEntitlementCubit>().state.entitlements ?? [];

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: response.length,
              separatorBuilder: (_, __) => SizedBox(height: 8.h),
              itemBuilder: (_, index) {
                final e = response[index];
                return GestureDetector(
                  onTap: () {
                    context.read<VacationCubit>().changeTab(3);
                    context.read<VacationCubit>().setEmployeeVacationsModel(e);
                  },
                  child: ItemTabAllVacationWidget(
                    employeeVacationsModel: e,
                    vacationBalances: vacationBalances,
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 30),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: GestureDetector(
            onTap: () {
              context.read<VacationCubit>().changeTab(1);
            },
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}