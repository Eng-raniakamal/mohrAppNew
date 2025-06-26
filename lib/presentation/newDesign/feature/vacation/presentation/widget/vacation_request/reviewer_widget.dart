import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/default_reviewer/default_reviewer_model.dart';
import '../../control/default_reviewer/default_reviewer_state.dart';

class ReviewerWidget extends StatelessWidget {
  const ReviewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("إضافة مراجع", style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(

          height: 50.h,
          padding: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.0),
          ),
          child: BlocBuilder<DefaultReviewerCubit, DefaultReviewerState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: const Text('جارى التحميل ...'),
                );
              } else if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }
              return DropdownButton<DefaultReviewerModel>(
                underline: const SizedBox(),
                hint: const Text('"إضافة مراجع"'),
                value: state.selectedReviewer,
                isExpanded: true,
                items:
                state.reviewers.map((reviewer) {
                  return DropdownMenuItem<DefaultReviewerModel>(
                    value: reviewer,
                    child: Text(reviewer.name ?? "NAME NOT FOUND"),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<DefaultReviewerCubit>().selectReviewer(value);
                    context.read<DefaultReviewerCubit>().addReviewer(value);
                  }
                },
                icon:
                       Padding(
                  padding: const EdgeInsets.all(BorderSide.strokeAlignOutside),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color(0xffEDF9FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12).r,
                        bottomLeft: Radius.circular(12).r,
                      ),
                    ),
                    child: Icon(Icons.add, color: Color(0xff1783B5), size: 30),
                  ),
                ),

              );
            },
          ),
        ),
      ],
    );
  }
}




// class ReviewerWidget extends StatelessWidget {
//   const ReviewerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => SelectedReviewersCubit(),
//     child: BlocBuilder<DefaultReviewerCubit, DefaultReviewerState>(
//         builder: (context, state) {
//           final reviewers = state.reviewers;
//           // final reviewerCubit = context.read<DefaultReviewerCubit>();
//           final selectedReviewerCubit = context.read<SelectedReviewersCubit>();
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("إضافة مراجع", style: context.text.bodyMedium),
//               SizedBox(height: 8.h),
//               DropdownButtonFormField<DefaultReviewerModel>(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.r),
//                     borderSide: BorderSide(color: context.color.outline),
//                   ),
//                   filled: true,
//                   fillColor: Color(0xffEDF9FF),
//                   prefixIcon: Icon(Icons.add, color: Color(0xff1783B5)),
//                 ),
//                 hint: Text("اختر مراجعًا"),
//                 items: reviewers.map((reviewer) {
//                   return DropdownMenuItem<DefaultReviewerModel>(
//                     value: reviewer,
//                     child: Text(reviewer.name ?? "بدون اسم"),
//
//                   );
//                 }).toList(),
//                 onChanged: (reviewer) {
//                   if (reviewer != null) {
//                     selectedReviewerCubit.addReviewer(reviewer);
//                   }
//                 },
//               ),
//               SizedBox(height: 16.h),
//               BlocBuilder<SelectedReviewersCubit, SelectedReviewersState>(
//                 builder: (context, selectedState) {
//                   return Wrap(
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: selectedState.selectedReviewers.map((reviewer) {
//                       return Chip(
//                         avatar: CircleAvatar(
//                           backgroundImage: NetworkImage(
//                             "https://api.hr-sync.com/Content/Images/employeeIcon.png",
//                           ),
//                         ),
//                         label: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(reviewer.name ?? "الاسم"),
//                             SizedBox(width: 8.w),
//                             Text(reviewer.id.toString(), style: TextStyle(
//                                 fontSize: 12, color: Colors.grey)),
//                           ],
//                         ),
//                         onDeleted: () =>
//                             selectedReviewerCubit.removeReviewer(reviewer),
//                       );
//                     }).toList(),
//                   );
//                 },
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }



// class ReviewerWidget extends StatelessWidget {
//   const ReviewerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         final requestedTypeId=context.read<VacationTypeCubit>().state.selectedVacation!.id.toString();
//         final RequestDefaultReviewerModel
//         requestDefaultReviewerModel = RequestDefaultReviewerModel(
//           requestType: "1",
//           date: '2025-05-12',
//           requestedTypeId: requestedTypeId,//'627',
//         );
//         context
//             .read<DefaultReviewerCubit>()
//             .fetchDefaultReviewers(
//           requestDefaultReviewerModel:
//           requestDefaultReviewerModel,
//         );
//       },
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("اضافة مراجع", style: context.text.bodyMedium),
//           SizedBox(height: 8.h),
//           Container(
//             height: 50.h,
//             padding: EdgeInsets.only(right: 12.w),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12).r,
//               border: Border.all(color: context.color.outline, width: 1.0),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("اضافة مراجع", style: context.text.bodyMedium),
//
//                 Padding(
//                   padding: const EdgeInsets.all(BorderSide.strokeAlignOutside),
//                   child: Container(
//                     height: 50.h,
//                     decoration: BoxDecoration(
//                       color: Color(0xffEDF9FF),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12).r,
//                         bottomLeft: Radius.circular(12).r,
//                       ),
//                     ),
//                     child: Icon(Icons.add, color: Color(0xff1783B5), size: 30),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class AddReviewerDropdown extends StatefulWidget {
//   @override
//   _AddReviewerDropdownState createState() => _AddReviewerDropdownState();
// }
//
// class _AddReviewerDropdownState extends State<AddReviewerDropdown> {
//   final List<Map<String, dynamic>> allReviewers = [
//     {'name': 'محمد طارق', 'id': '645533', 'avatarUrl': 'https://i.pravatar.cc/150?img=3'},
//     {'name': 'أحمد علي', 'id': '645534', 'avatarUrl': 'https://i.pravatar.cc/150?img=5'},
//     {'name': 'سارة محمد', 'id': '645535', 'avatarUrl': 'https://i.pravatar.cc/150?img=6'},
//   ];
//
//   final List<Map<String, dynamic>> selectedReviewers = [];
//
//   void _addReviewer(Map<String, dynamic> reviewer) {
//     if (!selectedReviewers.any((r) => r['id'] == reviewer['id'])) {
//       setState(() {
//         selectedReviewers.add(reviewer);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('إضافة مراجع', style: TextStyle(fontSize: 16)),
//         const SizedBox(height: 8),
//         DropdownButtonFormField<Map<String, dynamic>>(
//           decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(Icons.add),
//           ),
//           hint: const Text('اختر مراجعًا'),
//           items: allReviewers.map((reviewer) {
//             return DropdownMenuItem<Map<String, dynamic>>(
//               value: reviewer,
//               child: Text(reviewer['name']),
//             );
//           }).toList(),
//           onChanged: (selected) {
//             if (selected != null) _addReviewer(selected);
//           },
//         ),
//         const SizedBox(height: 16),
//         Wrap(
//           spacing: 8,
//           children: selectedReviewers.map((reviewer) {
//             return Chip(
//               avatar: CircleAvatar(
//                 backgroundImage: NetworkImage(reviewer['avatarUrl']),
//               ),
//               label: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(reviewer['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(width: 8),
//                   Text(reviewer['id'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
//                 ],
//               ),
//               onDeleted: () {
//                 setState(() {
//                   selectedReviewers.removeWhere((r) => r['id'] == reviewer['id']);
//                 });
//               },
//             );
//           }).toList(),
//         )
//       ],
//     );
//   }
// }
