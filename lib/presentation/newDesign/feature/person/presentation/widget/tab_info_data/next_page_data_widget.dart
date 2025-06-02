import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/tab_person_screen_cubit/tab_cubit.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../editEmployee/ViewModel/displayEmpBasicData_viewModel.dart';
import '../../../../../../editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import '../../../../salary/widget/salary_widget.dart';
import 'input_data_widget.dart';

class NextPageDataWidget extends StatefulWidget {
  NextPageDataWidget({super.key});

  @override
  State<NextPageDataWidget> createState() => _NextPageDataWidgetState();
}

class _NextPageDataWidgetState extends State<NextPageDataWidget> {

  final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
  saveBDViewModel? _saveViewModel;// =instance<saveBDViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final formKey = GlobalKey<FormState>();
  DateTime? birthDate;
  DateTime? date1;
  //DateTime date = DateTime(2023);
  bool? allowEdit;
  int? countryId;
  int? governorateId;
  int? districtId;
  int firstSelect =0;

  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerSubCity = TextEditingController();
  TextEditingController controllerAreaCity = TextEditingController();
  TextEditingController controllerAddressCity = TextEditingController();
  TextEditingController numberAddressControl = TextEditingController();
  TextEditingController numberBoxControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.addressText.tr(), style: AppTextStyle.iBMP16w700Black),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child:

              InputDataWidget(
                title: AppStrings.Country.tr(),
                hint: "مثال: مدينة نصر",
                controller: controllerCity,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: InputDataWidget(
                title: AppStrings.Governorate.tr(),
                hint: "مثال: مدينة نصر",
                controller: controllerSubCity,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: AppStrings.Replacement.tr(),
          hint: "مثال : حي العقاد",
          controller: controllerAreaCity,
        ),
        SizedBox(height: 16.h),
        StreamBuilder<BasicDataModel>(
    stream: displayViewModel.outputEmpBasicData,
    builder: (context, snapshot) {
    return
        InputDataWidget(
          title: AppStrings.addressText.tr(),
          hint: snapshot.data?.address?.addressText.toString(),
          //"مثال : القاهرة ، مدينة نصر ، شارع عباس العقاد",
          controller: controllerAddressCity,
        );}),
        SizedBox(height: 16.h),
        Text(AppStrings.PoBox.tr(), style: AppTextStyle.iBMP16w700Black),
    StreamBuilder<BasicDataModel>(
    stream:displayViewModel.outputEmpBasicData,
    builder: (context, snapshot) {
    return
    InputDataWidget(
          title: AppStrings.PoBox.tr(),
          hint: snapshot.data?.address?.zipCode.toString(),
          //"0000",
          controller: numberAddressControl,
        );}),
        SizedBox(height: 16.h),
    StreamBuilder<BasicDataModel?>(
    // stream: _displayViewModel.outputEmpBasicData,
    stream: displayViewModel.outputEmpBasicData,
    builder: (context, snapshot) {
    return
        InputDataWidget(
          title: AppStrings.PoBox.tr(),
          hint: snapshot.data?.address?.zipCode.toString(),
          //"0000",
          controller: numberBoxControl,
        );}),

        SizedBox(height: 16.h),

        ElevatedButton(
          onPressed: ()
    async {
   //  _saveViewModel!.SaveBasicData(
   // // empId!,
   //  //_arabicNameEditingController.text.toString(),
   //  //_englishNameEditingController.text.toString(),
   // // date.toString(),
   // // _nationalIdEditingController.text.toString(),
   // // _socialIdEditingController.text.toString(),
   // // _emailEditingController.text.toString(),
   // // _phoneEditingController.text.toString(),
   // // _emergencyNumberEditingController.text.toString(),
   //   //   numberAddressControl.text.toString(),
   //  //2,
   //      numberBoxControl.text.toString(),
   //  //_zipCodeEditingController.text.toString());
   // // displayDialoge(context);
            BlocProvider.of<TabCubit>(context).changeTab(0);

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.save.tr(),
                style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),

      ],
    );
  }
}
