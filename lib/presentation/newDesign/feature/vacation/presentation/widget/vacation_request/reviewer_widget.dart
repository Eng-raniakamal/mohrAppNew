import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/default_reviewer/request_default_reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_type/vacation_type_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewerWidget extends StatelessWidget {
  const ReviewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final requestedTypeId=context.read<VacationTypeCubit>().state.selectedVacation!.id.toString();
        final RequestDefaultReviewerModel
        requestDefaultReviewerModel = RequestDefaultReviewerModel(
          requestType: "1",
          date: '2025-05-12',
          requestedTypeId: requestedTypeId,//'627',
        );
        context
            .read<DefaultReviewerCubit>()
            .fetchDefaultReviewers(
          requestDefaultReviewerModel:
          requestDefaultReviewerModel,
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("اضافة مراجع", style: context.text.bodyMedium),
          SizedBox(height: 8.h),
          Container(
            height: 50.h,
            padding: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              border: Border.all(color: context.color.outline, width: 1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("اضافة مراجع", style: context.text.bodyMedium),

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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
