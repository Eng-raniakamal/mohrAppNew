import 'package:essmohr/presentation/newDesign/feature/layout/export_layout_file.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_button_widget.dart';
import '../../control/vacation_cubit/vacation_cubit.dart';
import '../../control/vacation_tab/vacation_tab_cubit.dart';
import '../vacation/body_tab_widget.dart';
import '../vacation_request_helper/vacation_request_helper.dart';

class ButtonPostVacationWidget extends StatelessWidget {
  const ButtonPostVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onTap: () {
        postFunction(context);
      },
      title: "قدم الطلب",
    );
  }

  void postFunction(BuildContext context) {
//الفاكشن المسسؤلة عن postVacation من خلال  multiCubit
   VacationRequestHelper.submitVacationRequest(context);



  }
}
