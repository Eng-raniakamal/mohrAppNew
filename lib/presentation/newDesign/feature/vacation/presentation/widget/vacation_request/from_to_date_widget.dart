import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/export_file/package_export.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/vacation_input_date_day_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FromToDateWidget extends StatelessWidget {
  const FromToDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VacationInputDateDayWidget(
          title: "من يوم",
          onDateSelected: (date) {
            context.read<DateCubit>().updateFromDate(date);
          },
        ),
        SizedBox(height: 16.h),
        VacationInputDateDayWidget(
          title: "الى يوم",
          onDateSelected: (date) {
            context.read<DateCubit>().updateToDate(date);
            context.read<CalculateVacationDurationCubit>().calculateDuration(
              calculateVacationDurationRequestModel:
                  CalculateVacationDurationRequestModel(
                    fromDate:
                        context.read<DateCubit>().state.fromDate,
                    toDate: context.read<DateCubit>().state.toDate,
                    vacationTypeId:
                        context
                            .read<VacationTypeCubit>()
                            .state
                            .selectedVacation
                            ?.id ??
                        0,
                    unit: 1,
                  ),
            );
          },
        ),
      ],
    );
  }
}
