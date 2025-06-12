import 'package:essmohr/presentation/newDesign/core/component/input_data_widget.dart';
import 'package:essmohr/presentation/newDesign/core/service/dependency_injection/export_file/package_export.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/add_request/list_reviewer_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/notes_input_field.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/vacation_type/vacation_type_state.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/from_to_date_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/input_duration_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/widget/vacation_request/vacation_dropdown_widget.dart';

import '../../../../layout/export_Layout_file.dart';
import 'button_post_vacation_widget.dart';
import 'file_picker_widget.dart';


class VacationRequestBodyWidget extends StatelessWidget {
  const VacationRequestBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(
          title: "طلب اجازة",
          onTap: () {
            context.read<VacationCubit>().changeTab(0);
          },
        ),
        SizedBox(height: 20.h),
        VacationDropdownWidget(),
        SizedBox(height: 16.h),
        FromToDateWidget(),
        SizedBox(height: 16.h),
        DurationWidget(),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "الموظف البديل",
          hint: "مهدى غانم",
          controller: context.read<PostVacationCubit>().employSecondController,
        ),
        SizedBox(height: 16.h),
        NotesInputField(
          controller: context.read<PostVacationCubit>().noteInputController,
        ),
        SizedBox(height: 16.h),
        BlocBuilder<VacationTypeCubit, VacationTypeState>(
          builder: (context, state) {
            if (state.selectedVacation?.requiredAttachment == true) {
              return FilePickerWidget();
            }
            return SizedBox();
          },
        ),
        ReviewerWidget(),
        SizedBox(height: 16.h),
        ListReviewerWidget(),
        SizedBox(height: 16.h),
        ButtonPostVacationWidget(),
        SizedBox(height: 30.h),
      ],
    );
  }


}

