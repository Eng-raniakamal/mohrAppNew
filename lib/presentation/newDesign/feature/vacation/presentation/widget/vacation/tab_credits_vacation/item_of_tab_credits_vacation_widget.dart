import 'package:essmohr/presentation/newDesign/feature/home/presentation/widget/report_widget/opening_time_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/export_layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/approve_cancel_request/approve_cancel_request_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/approve_cancel_request/approve_cancel_request_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation/item_of_from_to_widget.dart';
import '../../../../data/model/get_vacation_requests/get_vacation_requests_response_model.dart';

class ItemOfTabCreditsVacationWidget extends StatelessWidget {
  const ItemOfTabCreditsVacationWidget({super.key, required this.model});

  final GetVacationRequestsResponseModel model;
  static const IconData moreH = IconData(0xe402, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApproveCancelRequestCubit, ApproveCancelRequestState>(

      listener: (context, state) {
        if (state.isLoading == true) {
          context.showLoadingDialog();
        }
        if (state.isSuccess == true) {
          context.hideLoadingDialog();
          print("state.isSuccess: ${state.isSuccess}");
        }

        if (state.isSuccess == false) {
          context.hideLoadingDialog();
          context.viewSnackBar(message: "لايمكن التعديل", color: Colors.red);
        }

        if (state.errorMessage != null) {
          context.hideLoadingDialog();
          context.viewErrorDialog(state.errorMessage ?? "حدث خطأ ما");
        }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(12).r,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color: Colors.black12, width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // معتمده - تحت الطلب -مرفوض - التاريخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color:
                            model.status == "مرفوض" ? Colors.red : Colors.green,
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Text(
                        model.status ?? "معتمده",
                        style: context.text.titleMedium!.copyWith(
                          color: context.color.surface,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      model.vacationTypeName ?? "عارضة",
                      style: context.text.titleMedium,
                    ),
                  ],
                ),

                GestureDetector(
                  onTapDown: (details) {
                    dropdownMenu(context, details);
                  },

                  child: Icon(moreH),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("اسم الموظف  : ${model.employeeName}"),
                Text(' ${model.jobTitle ?? "مصمم تجربة مستخدم"}'),
              ],
            ),
            SizedBox(height: 12.h),
            OpeningTimeWidget(
              title: "المدة : ${model.duration!.toInt()} أيام",
              color: context.color.shadow,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ItemOfFromToWidget(
                    title: "من",
                    date: model.fromDate?.substring(0, 10) ?? "22 نوفمبر2024",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ItemOfFromToWidget(
                    title: "الى",
                    date: model.toDate?.substring(0, 10) ?? "22 نوفمبر2024",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dropdownMenu(BuildContext context, TapDownDetails details) async {
    final position = details.globalPosition;
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - 50.h,
        position.dy + 5.h,
        position.dx,
        position.dy,
      ),
      items: [
        const PopupMenuItem(value: 'approve', child: Text('اعتماد')),
        const PopupMenuItem(
          value: 'approve_with_note',
          child: Text('اعتماد مع ملاحظة'),
        ),
        const PopupMenuItem(value: 'reject', child: Text('رفض')),
      ],
    );

    if (selected != null) {
      switch (selected) {
        case 'approve':
          ApproveCancelRequestModel approveCancelRequestModel = ApproveCancelRequestModel(id: model.balance?.employeeId?? 0, value: 0, isApproved: true,);
          context.read<ApproveCancelRequestCubit>().approveCancelRequest(approveCancelRequestModel);

          break;
        case 'approve_with_note':
          if (context.mounted) {
            _showNoteBottomSheet(context);
          }
          break;
        case 'reject':
          ApproveCancelRequestModel approveCancelRequestModel =
              ApproveCancelRequestModel(
                id: model.id!?? 0,
                value: 0,
                isApproved: false,
              );
          if (context.mounted) {
            context.read<ApproveCancelRequestCubit>().approveCancelRequest(
              approveCancelRequestModel,
            );
          }
          break;
      }
    }
  }

  void _showNoteBottomSheet(BuildContext context) {
    final TextEditingController noteController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // اغلق الـ BottomSheet
                },
                child: const Icon(Icons.close),
              ),
              SizedBox(height: 8.h),

              const Text(
                'ضع ملاحظاتك',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                maxLines: 5,
                maxLength: 500,
                decoration: const InputDecoration(
                  hintText: 'نص للملاحظات',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  String note = noteController.text;
                  // احفظ الملاحظة أو ابعتها للسيرفر
                  Navigator.pop(context); // اغلق الـ BottomSheet
                },
                child: Container(
                  height: 40.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8).r,
                    border: Border.all(
                      color: context.color.primary,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'حفظ',
                      style: context.text.labelLarge!.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
