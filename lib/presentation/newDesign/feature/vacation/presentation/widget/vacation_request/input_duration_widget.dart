import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("المدة", style: context.text.bodyMedium),

        SizedBox(height: 8.h),

        Container(
          alignment: Alignment.centerRight,
          width: double.infinity,
          height: 50.h,
          padding: EdgeInsets.only(right: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.0),
          ),
          child: BlocBuilder<
            CalculateVacationDurationCubit,
            CalculateVacationDurationState
          >(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(child: Text("جارى التحميل "));
              }
              if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }
              if (state.response == null) {
                return Text("لم يتم حساب المدة بعد",style: TextStyle(color:Colors.grey.shade500),
                  );
              }
              if(state.response!.isValid==false){
                return  Text(
                  state.response!.message.toString().tr() ?? "المدة",
                  style: context.text.bodyMedium,
                );
              }

              return Text(
                state.response!.count.toString() ?? "المدة",
                style: context.text.bodyMedium,
              );
            },
          ),
        ),
      ],
    );
  }
}
