
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import '../../../application/app_prefs.dart';
import '../../../application/constants.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/appbarMain.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/profile_widget.dart';
import '../ViewModel/employeeBD_viewModel.dart';


class EmployeeBasicDataView extends StatefulWidget {
  const EmployeeBasicDataView({Key? key}) : super(key: key);

  @override
  State<EmployeeBasicDataView> createState() => _EmployeeBasicDataViewState();
}

class _EmployeeBasicDataViewState extends State<EmployeeBasicDataView> {

  final EmployeeBDViewModel _viewModel=instance<EmployeeBDViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();

  final TextEditingController _ArabicNameEditingController= TextEditingController();
  final TextEditingController _EnglishNameEditingController=TextEditingController();
  final TextEditingController _BirthDateEditingController=TextEditingController();
  final TextEditingController _NationalIdEditingController=TextEditingController();
  final TextEditingController _SocialIdEditingController= TextEditingController();
  final TextEditingController _EmailEditingController=TextEditingController();
  final TextEditingController _PhoneEditingController=TextEditingController();
  final TextEditingController _EmergencyNumberEditingController=TextEditingController();
  final TextEditingController _AddressTextEditingController= TextEditingController();
  final TextEditingController _DistrictIdEditingController=TextEditingController();
  final TextEditingController _POBoxEditingController=TextEditingController();
  final TextEditingController _ZipCodeEditingController=TextEditingController();
  _blind() {
    _viewModel.start();
    _ArabicNameEditingController.addListener(() {
      _viewModel.setArabicName(_ArabicNameEditingController.text);
    });
    _EnglishNameEditingController.addListener(() {
      _viewModel.setEnglishName(_EnglishNameEditingController.text);
    });
    _BirthDateEditingController.addListener(() {
      _viewModel.setBirthDate(_BirthDateEditingController.text);
    });
    _NationalIdEditingController.addListener(() {
      _viewModel.setNationalId(_NationalIdEditingController.text);
    });
    _SocialIdEditingController.addListener(() {
      _viewModel.setSocialId(_SocialIdEditingController.text);
    });
    _EmailEditingController.addListener(() {
      _viewModel.setEmail(_EmailEditingController.text);
    });
    _PhoneEditingController.addListener(() {
      _viewModel.setPhone(_PhoneEditingController.text);
    });
    _EmergencyNumberEditingController.addListener(() {
      _viewModel.setEmergencyNumber(_EmergencyNumberEditingController.text);
    });
    _AddressTextEditingController.addListener(() {
      _viewModel.setAddressText(_AddressTextEditingController.text);
    });
    _DistrictIdEditingController.addListener(() {
      _viewModel.setDistrictId(int.parse(_DistrictIdEditingController.text));
    });
    _POBoxEditingController.addListener(() {
      _viewModel.setPOBox(_POBoxEditingController.text);
    });
    _ZipCodeEditingController.addListener(() {
      _viewModel.setZipCode(_ZipCodeEditingController.text);
    });



  }

  @override
  void initState()
  {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    //appBar: buildAppBarMain(context),
                    backgroundColor: colorManager.white,
                    body: StreamBuilder<FlowState>(
                      stream: _viewModel.outputState,
                      builder: (context, snapshot) {
                        return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                                () {
                              _viewModel.addBasicData();
                            }) ??
                            _getContentWidget();
                      },
                    ),
                  ))
      );
  }

  // Widget _getTabWidget(){
  //   return
  //     SizedBox(
  //       height: 50,
  //       child: AppBar(
  //         bottom: const TabBar(
  //           tabs: [
  //             Tab(
  //                 icon: Icon(Icons.account_box),text: "Basic Data"
  //             ),
  //             Tab(
  //                 icon: Icon(Icons.abc,),text: "Skills"),
  //           ],
  //         ),
  //       ),
  //     );
  //
  // }

  Widget _getContentWidget() {
    return Container(
        padding: EdgeInsets.only(top:30),
        child: SingleChildScrollView(
          child: Form(
            key: _Formkey,
            child: Column(
              children: [

                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28, right: 28),
                  child: StreamBuilder<String?>(
                   // stream: _viewModel.outputErrorDate,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _ArabicNameEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.arabicName.tr(),
                              labelText: AppStrings.arabicName.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20,
                            left: 28,
                            right: 28,
                            bottom: 12),

                        child: StreamBuilder<String?>(
                          // stream: _viewModel.outputErrorMobileNumber,
                          builder: (context, snapshot) {
                            return TextFormField(
                                keyboardType: TextInputType.text,
                                controller:
                                _EnglishNameEditingController,
                                decoration: InputDecoration(
                                    hintText: AppStrings.englishName.tr(),
                                    labelText: AppStrings.englishName.tr(),
                                    errorText: snapshot.data));
                          },
                        ))


                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28, right: 28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorEmail,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _BirthDateEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.birthDate.tr(),
                              labelText: AppStrings.birthDate.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _NationalIdEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.nationalId.tr(),
                              labelText: AppStrings.nationalId.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),

                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _SocialIdEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.socialId.tr(),
                              labelText: AppStrings.socialId.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),

                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _EmailEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.email.tr(),
                              labelText: AppStrings.email.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),

                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _PhoneEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.phone.tr(),
                              labelText: AppStrings.phone.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),

                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _EmergencyNumberEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.emergencyNumber.tr(),
                              labelText: AppStrings.emergencyNumber.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),

                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _AddressTextEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.addressText.tr(),
                              labelText: AppStrings.addressText.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _DistrictIdEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.districtId.tr(),
                              labelText: AppStrings.districtId.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _POBoxEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.pOBox.tr(),
                              labelText: AppStrings.pOBox.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12,
                      left: 28,
                      right:28),
                  child: StreamBuilder<String?>(
                    // stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _ZipCodeEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.zipCode.tr(),
                              labelText: AppStrings.zipCode.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                const SizedBox(height:25),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 28, right: 28),
                    child: StreamBuilder<bool>(
                      //stream: _viewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height:24,
                          child: ElevatedButton(
                              onPressed: () {
                                _viewModel.addBasicData();
                              },
                              // : null,
                              child: const Text(AppStrings.addBasicData).tr()),
                        );
                      },
                    )),

              ],
            ),
          ),
        ));
  }


  void dispose(){
    _viewModel.dispose();
    super.dispose();
  }
}
