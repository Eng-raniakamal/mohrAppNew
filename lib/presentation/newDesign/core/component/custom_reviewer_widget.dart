
// class CustomReviewerWidget extends StatelessWidget {
//   const CustomReviewerWidget({
//     super.key, this.nameReviewer, this.statusReviewer, this.noteReviewer,
//   });
// final String?nameReviewer;
// final String?statusReviewer;
// final  String?noteReviewer;
//
//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.only(left: 5).r,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("المراجع ", style: textTheme.bodyMedium),
//                 Text(statusReviewer??" ", style: textTheme.bodyMedium),
//               ],
//             ),
//             SizedBox(height: 8.h),
//             CustomDecoratorContainerWidget(child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//                 Text(
//                   nameReviewer ?? " ",
//                   style: textTheme.bodyLarge,
//                 ), // InputDataWidget(
//                 Text(
//                   statusReviewer ?? "",
//                   style: textTheme.bodyLarge,
//                 ),
//               ],
//             ),)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:essmohr/domain/model/model.dart';

import '../../feature/layout/export_Layout_file.dart';
import 'custom_decorator_container_widget.dart';

// class CustomReviewerWidget extends StatelessWidget {
//   const CustomReviewerWidget({
//     super.key,
//     required this.reviewerModel,
//   });
//
//   final RequestReviewers reviewerModel;
//
//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//
//     return Container(
//       margin: EdgeInsets.only(left: 5).r,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// عنوان "المراجع" + الحالة
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("المراجع", style: textTheme.bodyMedium),
//               _buildStatus(reviewerModel.status, textTheme),
//             ],
//           ),
//           SizedBox(height: 8.h),
//
//           /// بيانات المراجع
//           CustomDecoratorContainerWidget(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// الاسم
//                 Text(
//                   reviewerModel.name ?? "بدون اسم",
//                   style: textTheme.bodyLarge,
//                 ),
//
//                 /// الملاحظة
//                 if ((reviewerModel.note ?? '').isNotEmpty)
//                   Padding(
//                     padding: EdgeInsets.only(top: 6.h),
//                     child: Text(
//                       "ملاحظة: ${reviewerModel.note!}",
//                       style: textTheme.bodySmall,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatus(String? status, TextTheme textTheme) {
//     switch (status?.toLowerCase()) {
//       case "قيد الاعتماد":
//         return Text(
//           status!,
//           style: textTheme.bodyMedium?.copyWith(color: Colors.orange),
//         );
//       case "موافقة":
//         return Text(
//           status!,
//           style: textTheme.bodyMedium?.copyWith(color: Colors.green),
//         );
//       case "مرفوض":
//         return Text(
//           status!,
//           style: textTheme.bodyMedium?.copyWith(color: Colors.red),
//         );
//       default:
//         return Text(
//           status ?? "",
//           style: textTheme.bodyMedium,
//         );
//     }
//   }
// }

class CustomReviewerWidget extends StatelessWidget {
  const CustomReviewerWidget({
    super.key,
    required this.reviewerList,
  });

  final List<RequestReviewers> reviewerList;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reviewerList.map((reviewer) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6.h),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("المراجع: ${reviewer.name}", style: textTheme.bodyMedium),
              if ((reviewer.status ?? '').isNotEmpty)
                Text("الحالة: ${reviewer.status}", style: textTheme.bodySmall),
              if ((reviewer.note ?? '').isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text("ملاحظة: ${reviewer.note}", style: textTheme.bodySmall),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}