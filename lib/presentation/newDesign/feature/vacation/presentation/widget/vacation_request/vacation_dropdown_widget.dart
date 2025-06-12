import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/domain/entity/vacation_type_entity.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_type/vacation_type_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_type/vacation_type_state.dart';

class VacationDropdownWidget extends StatelessWidget {
  const VacationDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("نوع الاجازة", style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.0),
          ),
          child: BlocBuilder<VacationTypeCubit, VacationTypeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: const Text('جارى التحميل ...'),
                );
              } else if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }
              return DropdownButton<VacationTypeEntity>(
                underline: const SizedBox(),
                hint: const Text('اختر نوع الإجازة'),
                value: state.selectedVacation,
                isExpanded: true,
                items:
                state.vacationTypes.map((vacation) {
                  return DropdownMenuItem<VacationTypeEntity>(
                    value: vacation,
                    child: Text(vacation.name ?? "NAME NOT FOUND"),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<VacationTypeCubit>().selectVacation(value);
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
              );
            },
          ),
        ),
      ],
    );
  }
}
