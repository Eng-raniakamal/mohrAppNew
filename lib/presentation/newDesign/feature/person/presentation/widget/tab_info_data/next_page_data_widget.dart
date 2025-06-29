import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/page_one_of_info_data_widget.dart';
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
//
// class NextPageDataWidget extends StatefulWidget {
//   NextPageDataWidget({super.key});
//
//   @override
//   State<NextPageDataWidget> createState() => _NextPageDataWidgetState();
// }
//
// class _NextPageDataWidgetState extends State<NextPageDataWidget> {
//
//   final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
//   saveBDViewModel? _saveViewModel;// =instance<saveBDViewModel>();
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   final formKey = GlobalKey<FormState>();
//   DateTime? birthDate;
//   DateTime? date1;
//   //DateTime date = DateTime(2023);
//   bool? allowEdit;
//   int? countryId;
//   int? governorateId;
//   int? districtId;
//   int firstSelect =0;
//
//   TextEditingController controllerCity = TextEditingController();
//   TextEditingController govController = TextEditingController();
//   TextEditingController controllerAreaCity = TextEditingController();
//   TextEditingController controllerAddressCity = TextEditingController();
//   TextEditingController numberAddressControl = TextEditingController();
//   TextEditingController numberBoxControl = TextEditingController();
//   TextEditingController zipCodeEditingController=TextEditingController();
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // ربط البيانات بالـ ViewModel
//     // controllerCity.addListener(() => _saveViewModel.setCountryName(countryController.text));
//     // govController.addListener(() => _saveViewModel.setGovernorate(govController.text));
//     // districtController.addListener(() => _saveViewModel.setDistrict(districtController.text));
//     // addressController.addListener(() => _saveViewModel.setAddressText(addressController.text));
//     // zipCodeController.addListener(() => _saveViewModel.setZipCode(zipCodeController.text));
//
//
//     numberAddressControl.addListener(() {
//       _saveViewModel!.setAddressText(numberAddressControl.text);
//     });
//     // _districtIdEditingController.addListener(() {
//     //   _saveViewModel!.setDistrictId(int.parse(_districtIdEditingController.text));
//     // });
//     numberBoxControl.addListener(() {
//       _saveViewModel!.setPOBox(numberBoxControl.text);
//     });
//     zipCodeEditingController.addListener(() {
//       _saveViewModel!.setZipCode(zipCodeEditingController.text);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(AppStrings.addressText.tr(), style: AppTextStyle.iBMP16w700Black),
//         SizedBox(height: 16.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width * .45,
//               child:
//
//               InputDataWidget(
//                 title: AppStrings.Country.tr(),
//                 hint: "مثال: مدينة نصر",
//                 controller: controllerCity,
//               ),
//             ),
//             SizedBox(
//               width: MediaQuery.sizeOf(context).width * .45,
//               child: InputDataWidget(
//                 title: AppStrings.Governorate.tr(),
//                 hint: "مثال: مدينة نصر",
//                 controller: govController,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         InputDataWidget(
//           title: AppStrings.Replacement.tr(),
//           hint: "مثال : حي العقاد",
//           controller: controllerAreaCity,
//         ),
//         SizedBox(height: 16.h),
//         StreamBuilder<BasicDataModel>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//     return
//         InputDataWidget(
//           title: AppStrings.addressText.tr(),
//           hint: snapshot.data?.address?.addressText.toString(),
//           //"مثال : القاهرة ، مدينة نصر ، شارع عباس العقاد",
//           controller: controllerAddressCity,
//         );}),
//         SizedBox(height: 16.h),
//         Text(AppStrings.PoBox.tr(), style: AppTextStyle.iBMP16w700Black),
//     StreamBuilder<BasicDataModel>(
//     stream:displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//     return
//     InputDataWidget(
//           title: AppStrings.PoBox.tr(),
//           hint: snapshot.data?.address?.zipCode.toString(),
//           //"0000",
//           controller: numberAddressControl,
//         );}),
//         SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel?>(
//     // stream: _displayViewModel.outputEmpBasicData,
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//     return
//         InputDataWidget(
//           title: AppStrings.PoBox.tr(),
//           hint: snapshot.data?.address?.zipCode.toString(),
//           //"0000",
//           controller: numberBoxControl,
//         );}),
//
//         SizedBox(height: 16.h),
//
//         ElevatedButton(
//           onPressed: ()
//     async {
//    // _saveViewModel!.SaveBasicData(
//    // empId!,
//     //_arabicNameEditingController.text.toString(),
//     //_englishNameEditingController.text.toString(),
//    // date.toString(),
//    // _nationalIdEditingController.text.toString(),
//    // _socialIdEditingController.text.toString(),
//    // _emailEditingController.text.toString(),
//    // _phoneEditingController.text.toString(),
//    // _emergencyNumberEditingController.text.toString(),
//      //   numberAddressControl.text.toString(),
//     //2,
//        // numberBoxControl.text.toString(),
//     //_zipCodeEditingController.text.toString());
//    // displayDialoge(context);
//
//             BlocProvider.of<TabCubit>(context).changeTab(0);
//
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColor.primary,
//             minimumSize: Size(double.infinity, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12).r,
//             ),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 AppStrings.save.tr(),
//                 style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
//               ),
//               Icon(Icons.arrow_forward, color: Colors.white),
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
// }
//
//
class NextPageDataWidget extends StatefulWidget {
  const NextPageDataWidget({super.key});

  @override
  State<NextPageDataWidget> createState() => _NextPageDataWidgetState();
}

class _NextPageDataWidgetState extends State<NextPageDataWidget> {
  final formKey = GlobalKey<FormState>();
  final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
  final SaveBDViewModel _saveViewModel = instance<SaveBDViewModel>();
  final EmployeeBasicDataViewModel _displayViewModel = instance<EmployeeBasicDataViewModel>();
  final TextEditingController controllerCity = TextEditingController();
  final TextEditingController govController = TextEditingController();
  final TextEditingController controllerAreaCity = TextEditingController();
  final TextEditingController controllerAddressCity = TextEditingController();
  final TextEditingController numberAddressControl = TextEditingController();
  final TextEditingController numberBoxControl = TextEditingController();
  final TextEditingController zipCodeEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayViewModel.start();
    initSave2EmpBasicDataModule();

    // controllerCity.addListener(() {
    //   _saveViewModel.setCountryName(controllerCity.text);
    // });
    //
    // govController.addListener(() {
    //   _saveViewModel.setGovernorate(govController.text);
    // });
    //
    // controllerAreaCity.addListener(() {
    //   _saveViewModel.setDistrict(controllerAreaCity.text);
    // });

    controllerAddressCity.addListener(() {
      _saveViewModel.setAddressText(controllerAddressCity.text);
    });

    numberAddressControl.addListener(() {
      _saveViewModel.setPOBox(numberAddressControl.text);
    });

    numberBoxControl.addListener(() {
      _saveViewModel.setPOBox(numberBoxControl.text); // يمكن استخدامه لقيمة ثانية إن لزم
    });

    zipCodeEditingController.addListener(() {
      _saveViewModel.setZipCode(zipCodeEditingController.text);
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //     key: formKey,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(AppStrings.addressText.tr(), style: AppTextStyle.iBMP16w700Black),
  //         SizedBox(height: 16.h),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             SizedBox(
  //               width: MediaQuery.sizeOf(context).width * .45,
  //               child: InputDataWidget(
  //                 title: AppStrings.Country.tr(),
  //                 hint: "مثال: مصر",
  //                 controller: controllerCity, readOnly: null,
  //               ),
  //             ),
  //             SizedBox(
  //               width: MediaQuery.sizeOf(context).width * .45,
  //               child: InputDataWidget(
  //                 title: AppStrings.Governorate.tr(),
  //                 hint: "مثال: القاهرة",
  //                 controller: govController,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16.h),
  //         InputDataWidget(
  //           title: AppStrings.Replacement.tr(),
  //           hint: "مثال: مدينة نصر",
  //           controller: controllerAreaCity,
  //         ),
  //         SizedBox(height: 16.h),
  //         StreamBuilder<BasicDataModel>(
  //           stream: _displayViewModel.outputEmpBasicData,
  //           builder: (context, snapshot) {
  //             return InputDataWidget(
  //               title: AppStrings.addressText.tr(),
  //               hint: snapshot.data?.address?.addressText ?? "مثال: شارع عباس العقاد",
  //               controller: controllerAddressCity,
  //             );
  //           },
  //         ),
  //
  //         SizedBox(height: 16.h),
  //         InputDataWidget(
  //           title: AppStrings.PoBox.tr(),
  //           hint: "مثال: 54321",
  //           controller: numberBoxControl,
  //         ),
  //         SizedBox(height: 16.h),
  //         InputDataWidget(
  //           title: AppStrings.zipCode.tr(),
  //           hint: "مثال: 11765",
  //           controller: zipCodeEditingController,
  //         ),
  //         SizedBox(height: 24.h),
  //         ElevatedButton(
  //           onPressed: () async {
  //             if (formKey.currentState!.validate()) {
  //               final result = await _saveViewModel.saveBasicData();
  //
  //               if(result==false)
  //               {
  //                      showToast("فشل في الحفظ");
  //               }
  //                     showToast("تم الحفظ بنجاح");
  //
  //               // يمكنك هنا تنفيذ حفظ البيانات النهائي إن رغبت
  //               BlocProvider.of<TabCubit>(context).changeTab(0);
  //             }
  //           },
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: AppColor.primary,
  //             minimumSize: const Size(double.infinity, 50),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12).r,
  //             ),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 AppStrings.save.tr(),
  //                 style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
  //               ),
  //               const Icon(Icons.arrow_forward, color: Colors.white),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BasicDataModel?>(
      stream: _displayViewModel.outputEmpBasicData,
      builder: (context, snapshot) {
        //final allowEdit = snapshot.data?.allowEdit ?? true;

        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(AppStrings.addressText.tr(), style: AppTextStyle.iBMP16w700Black),
              // SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .45,
                    child: InputDataWidget(
                      title: AppStrings.Country.tr(),
                      hint: "مثال: المملكة العربية السعودية",
                      controller: controllerCity,
                      readOnly: !allowEdit!,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .45,
                    child: InputDataWidget(
                      title: AppStrings.Governorate.tr(),
                      hint: "مثال:الرياض ",
                      controller: govController,
                      readOnly: !allowEdit!,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              InputDataWidget(
                title: AppStrings.Replacement.tr(),
                hint: "",
                controller: controllerAreaCity,
                readOnly: !allowEdit!,
              ),
              SizedBox(height: 16.h),

              InputDataWidget(
                title: AppStrings.addressText.tr(),
                hint: snapshot.data?.address?.addressText ?? "مثال: شارع الهدى",
                controller: controllerAddressCity,
                readOnly: !allowEdit!,
              ),
              SizedBox(height: 16.h),

              InputDataWidget(
                title: AppStrings.PoBox.tr(),
                hint: " ",
                controller: numberBoxControl,
                readOnly: !allowEdit!,
              ),
              SizedBox(height: 16.h),

              InputDataWidget(
                title: AppStrings.zipCode.tr(),
                hint: " ",
                controller: zipCodeEditingController,
                readOnly: !allowEdit!,
              ),
              SizedBox(height: 24.h),

              // ElevatedButton(
              //   onPressed: allowEdit
              //       ? () async {
              //     if (formKey.currentState!.validate()) {
              //       final result = await _saveViewModel.saveBasicData();
              //       if (result == false) {
              //         showToast("فشل في الحفظ");
              //       } else {
              //         showToast("تم الحفظ بنجاح");
              //         BlocProvider.of<TabCubit>(context).changeTab(0);
              //       }
              //     }
              //   }
              //       : null,
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColor.primary,
              //     minimumSize: const Size(double.infinity, 50),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12).r,
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Text(
              //         AppStrings.save.tr(),
              //         style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
              //       ),
              //       const Icon(Icons.arrow_forward, color: Colors.white),
              //     ],
              //   ),
              // ),

              ElevatedButton(
                onPressed: () async {
                  if (!allowEdit!) {
                    showToast("هذا الموظف لا يمكنه تعديل البيانات الخاصة به");
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    final result = await _saveViewModel.saveBasicData();
                    if (result == false) {
                      showToast("فشل في الحفظ");
                    } else {
                      showToast("تم الحفظ بنجاح");
                      BlocProvider.of<TabCubit>(context).changeTab(0);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  minimumSize: const Size(double.infinity, 50),
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
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }



  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 4),
      ),
    );
  }
}