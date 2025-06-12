import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/file_picker/file_picker_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/file_picker/file_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilePickerCubit(),
      child: BlocBuilder<FilePickerCubit, FilePickerState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.read<FilePickerCubit>().pickImageFile(),
                  child: Column(
                    children: [
                      AddDocWidget(),
                      SizedBox(height: 5.h),
                      if (state is FilePickerLoading) ...[
                        Center(child: SizedBox(
                            height: 10.h,width: 10.w,
                            child: CircularProgressIndicator())),
                        Text(
                          "جارى اختيار الصورة",
                          style: context.text.labelSmall,
                        ),
                      ] else if (state is FilePickerSuccess) ...[
                        Text(
                          "تم اختيار الصورة",
                          style: context.text.labelSmall,
                        ),
                      ] else if (state is FilePickerError) ...[
                        Text(
                          "خطأ: ${state.message}",
                          style: context.text.labelSmall,
                        ),
                      ] else if (state is FilePickerCancelled) ...[
                        Text(
                          "لم يتم اختيار أي صورة.",
                          style: context.text.labelSmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddDocWidget extends StatelessWidget {
  const AddDocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(color: AppColor.blue),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.blue),
              ),
              child: Center(
                child: Icon(Icons.add, color: AppColor.blue, size: 12.r),
              ),
            ),

            SizedBox(width: 8.w),
            Text(
              "اضافة وثائق",
              style: context.text.titleLarge!.copyWith(color: AppColor.blue),
            ),
          ],
        ),
      ),
    );
  }
}
