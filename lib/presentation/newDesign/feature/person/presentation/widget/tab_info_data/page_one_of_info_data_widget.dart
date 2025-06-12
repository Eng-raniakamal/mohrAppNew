import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/page_cubit/page_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/custom_image_pick_widget.dart';
//import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/input_birth_day_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/input_data_widget.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../../domain/usecase/saveEmpBD_useCase.dart';
import '../../../../../../editEmployee/ViewModel/displayEmpBasicData_viewModel.dart';
import '../../../../../../editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import '../../../../../core/component/custom_elevated_button_widget.dart';
import '../../../../../core/component/input_date_day_widget.dart';


// class PageOneOfInfoDataWidget extends StatefulWidget {
//   PageOneOfInfoDataWidget({super.key});
//
//   @override
//   State<PageOneOfInfoDataWidget> createState() => _PageOneOfInfoDataWidgetState();
// }
//
// class _PageOneOfInfoDataWidgetState extends State<PageOneOfInfoDataWidget> {
//
//   final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
//   SaveBDViewModel? _saveViewModel;// =instance<saveBDViewModel>();
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//
//   final formKey = GlobalKey<FormState>();
//   DateTime? birthDate;
//   DateTime? date1;
//   DateTime date = DateTime(2023);
//   bool? allowEdit;
//   int? countryId;
//   int? governorateId;
//   int? districtId;
//   int firstSelect =0;
//   int? empId;
//
//
//   TextEditingController arabicNameController=TextEditingController();
//   TextEditingController engNameController=TextEditingController();
//   TextEditingController emailController=TextEditingController();
//   TextEditingController telephoneController=TextEditingController();
//   TextEditingController idController=TextEditingController();
//   TextEditingController nIdController=TextEditingController();
//
//   _blind() {
//     displayViewModel.start();
//     displayViewModel.outputEmpBasicData?.listen((data) async {
//       final useCase = instance<saveEmpBasicDataUseCase>();
//       String userid= await _appPreferences.getUserToken();
//        empId=await _appPreferences.getEmpIdToken();
//       _saveViewModel= saveBDViewModel(useCase,userid
//         //,data.employee!,data.address!
//       );
//     });
//
//     arabicNameController.addListener(()
//     {
//       _saveViewModel!.setArabicName(arabicNameController.text);
//     }
//     );
//     engNameController.addListener(() {
//       _saveViewModel!.setEnglishName(engNameController.text);
//    });
//     // _birthDateEditingController.addListener(() {
//     //   _saveViewModel!.setBirthDate(_birthDateEditingController.text);
//     // });
//     nIdController.addListener(() {
//       _saveViewModel!.setNationalId(nIdController.text);
//     });
//     idController.addListener(() {
//       _saveViewModel!.setSocialId(idController.text);
//     });
//     emailController.addListener(() {
//       _saveViewModel!.setEmail( emailController.text);
//     });
//     // _phoneEditingController.addListener(() {
//     //   _saveViewModel!.setPhone(_phoneEditingController.text);
//     // });
//     // _emergencyNumberEditingController.addListener(() {
//     //   _saveViewModel!.setEmergencyNumber(_emergencyNumberEditingController.text);
//     // });
//     // _addressTextEditingController.addListener(() {
//     //   _saveViewModel!.setAddressText(_addressTextEditingController.text);
//     // });
//     // _districtIdEditingController.addListener(() {
//     //   _saveViewModel!.setDistrictId(int.parse(_districtIdEditingController.text));
//     // });
//     // _pOBoxEditingController.addListener(() {
//     //   _saveViewModel!.setPOBox(_pOBoxEditingController.text);
//     // });
//     // _zipCodeEditingController.addListener(() {
//     //   _saveViewModel!.setZipCode(_zipCodeEditingController.text);
//     // });
//   }
//
//   @override
//   void initState() {
//     _blind();
//     super.initState();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomImagePickWidget(),
//         SizedBox(height: 21.h),
//         Center(
//           // child: Text(
//           //   "اخر عملية تسجيل دخول | اليوم 21:31 AM",
//           //   style: AppTextStyle.iBMP14w500,
//           // ),
//         ),
//         SizedBox(height: 16.h),
//         Text("بياناتي", style: AppTextStyle.iBMP16w700Black),
//         SizedBox(height: 16.h),
//
//     StreamBuilder<BasicDataModel?>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//       return
//       InputDataWidget(title: AppStrings.ArabicName.tr(),
//         hint: snapshot.data?.employee
//               ?.arabicName?.toString(),
//         //"الاسم بالكامل",
//         controller: arabicNameController,)
//       ;
//
//     }),
//         SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel?>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//       return
//         InputDataWidget(title: AppStrings.EnglishName.tr(),
//           hint: snapshot.data?.employee
//               ?.englishName?.toString(),
//           controller: engNameController,);
//
//     }),
//     SizedBox(height: 16.h),
//         InputDateDayWidget(data: AppStrings.birthDate.tr(),),
//         SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//       return
//         InputDataWidget(title: AppStrings.email.tr(),
//           hint:snapshot.data?.employee?.email
//               .toString(),
//           //"example@gmail.com",
//           controller: emailController,)
//       ;
//
//     }),
//     SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//       return
//         InputDataWidget(title: AppStrings.phone.tr(),
//           hint: snapshot.data?.employee?.phone
//               .toString(),
//           controller: telephoneController,)
//       ;
//     }),
//         SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel>(
//     stream:displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//     return
//         InputDataWidget(title: AppStrings.NationalId.tr(),
//           hint:  snapshot.data?.employee?.nationalId
//               .toString(),
//           //"000 0 000",
//           controller: idController,)
//         ;}),
//         SizedBox(height: 16.h),
//     StreamBuilder<BasicDataModel>(
//     stream: displayViewModel.outputEmpBasicData,
//     builder: (context, snapshot) {
//       return
//         InputDataWidget(title: AppStrings.socialId.tr(),
//           hint: snapshot.data?.employee?.socialId
//               .toString(),
//           controller: nIdController,)
//       ;
//     }),SizedBox(height: 16.h),
//         CustomElevatedButtonWidget(
//           icon: Icons.arrow_forward,
//           data:  "التالي",
//           onPressed:  () {
//             BlocProvider.of<PageCubit>(context).changePage(1);
//           },
//         ),
//       ],
//     );
//   }
// }

class PageOneOfInfoDataWidget extends StatefulWidget {
  PageOneOfInfoDataWidget({super.key});

  @override
  State<PageOneOfInfoDataWidget> createState() => _PageOneOfInfoDataWidgetState();
}

class _PageOneOfInfoDataWidgetState extends State<PageOneOfInfoDataWidget> {
  final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
  SaveBDViewModel? _saveViewModel;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final formKey = GlobalKey<FormState>();
  DateTime? birthDate;
  DateTime? date1;
  DateTime date = DateTime(2023);
  bool? allowEdit;
  int? countryId;
  int? governorateId;
  int? districtId;
  int firstSelect = 0;
  int? empId;

  TextEditingController arabicNameController = TextEditingController();
  TextEditingController engNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nIdController = TextEditingController();

  _bind() {
    displayViewModel.start();

    displayViewModel.outputEmpBasicData?.listen((data) async {
      final useCase = instance<saveEmpBasicDataUseCase>();
      String userid = await _appPreferences.getUserToken();
      empId = await _appPreferences.getEmpIdToken();

      // إنشاء ViewModel وحفظه
      _saveViewModel = SaveBDViewModel(useCase, userid);

      // تحميل البيانات الحالية في viewModel
      if (data.employee != null) {
        _saveViewModel?.setArabicName(data.employee!.arabicName ?? "");
        _saveViewModel?.setEnglishName(data.employee!.englishName ?? "");
        _saveViewModel?.setEmail(data.employee!.email ?? "");
        _saveViewModel?.setPhone(data.employee!.phone ?? "");
        _saveViewModel?.setNationalId(data.employee!.nationalId ?? "");
        _saveViewModel?.setSocialId(data.employee!.socialId ?? "");
      }

      // الربط مع الـ controllers
      arabicNameController.text = data.employee?.arabicName ?? "";
      engNameController.text = data.employee?.englishName ?? "";
      emailController.text = data.employee?.email ?? "";
      telephoneController.text = data.employee?.phone ?? "";
      nIdController.text = data.employee?.nationalId ?? "";
      idController.text = data.employee?.socialId ?? "";
    });

    // Listeners
    arabicNameController.addListener(() {
      _saveViewModel?.setArabicName(arabicNameController.text);
    });
    engNameController.addListener(() {
      _saveViewModel?.setEnglishName(engNameController.text);
    });
    emailController.addListener(() {
      _saveViewModel?.setEmail(emailController.text);
    });
    telephoneController.addListener(() {
      _saveViewModel?.setPhone(telephoneController.text);
    });
    nIdController.addListener(() {
      _saveViewModel?.setNationalId(nIdController.text);
    });
    idController.addListener(() {
      _saveViewModel?.setSocialId(idController.text);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImagePickWidget(),
        SizedBox(height: 21.h),
        Center(),
        SizedBox(height: 16.h),
        Text("بياناتي", style: AppTextStyle.iBMP16w700Black),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel?>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.ArabicName.tr(),
                hint: snapshot.data?.employee?.arabicName?.toString(),
                controller: arabicNameController,
              );
            }),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel?>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.EnglishName.tr(),
                hint: snapshot.data?.employee?.englishName?.toString(),
                controller: engNameController,
              );
            }),
        SizedBox(height: 16.h),

        InputDateDayWidget(data: AppStrings.birthDate.tr()),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.email.tr(),
                hint: snapshot.data?.employee?.email.toString(),
                controller: emailController,
              );
            }),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.phone.tr(),
                hint: snapshot.data?.employee?.phone.toString(),
                controller: telephoneController,
              );
            }),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.NationalId.tr(),
                hint: snapshot.data?.employee?.nationalId.toString(),
                controller: nIdController,
              );
            }),
        SizedBox(height: 16.h),

        StreamBuilder<BasicDataModel>(
            stream: displayViewModel.outputEmpBasicData,
            builder: (context, snapshot) {
              return InputDataWidget(
                title: AppStrings.socialId.tr(),
                hint: snapshot.data?.employee?.socialId.toString(),
                controller: idController,
              );
            }),
        SizedBox(height: 16.h),

        CustomElevatedButtonWidget(
          icon: Icons.arrow_forward,
          data: "التالي",
          onPressed: () {
            BlocProvider.of<PageCubit>(context).changePage(1);
          },
        ),
      ],
    );
  }
}