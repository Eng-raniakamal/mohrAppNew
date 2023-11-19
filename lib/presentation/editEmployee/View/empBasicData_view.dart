
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/usecase/saveEmpBD_useCase.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/displayEmpBasicData_viewModel.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import '../../../application/app_prefs.dart';
import '../../common/state_renderer/state_render_impl.dart';



class BasicDataView extends StatefulWidget {
  const BasicDataView({Key? key}) : super(key: key);

  @override
  _BasicDataViewState createState() => _BasicDataViewState();
}

class _BasicDataViewState extends State<BasicDataView> {

  final EmployeeBasicDataViewModel _displayviewModel = instance<EmployeeBasicDataViewModel>();
  saveBDViewModel? _saveViewModel;// =instance<saveBDViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey = GlobalKey<FormState>();
  DateTime? birthDate;
  DateTime? date;
  bool? allowEdit;
  int? countryId;
  int? governorateId;
  int? districtId;
  int firstSelect =0;
  //
  final TextEditingController _ArabicNameEditingController = TextEditingController();
  final TextEditingController _EnglishNameEditingController = TextEditingController();
  final TextEditingController _NationalIdEditingController = TextEditingController();
  final TextEditingController _BirthDateEditingController = TextEditingController();
  final TextEditingController _SocialIdEditingController = TextEditingController();
  final TextEditingController _EmailEditingController = TextEditingController();
  final TextEditingController _PhoneEditingController = TextEditingController();
  final TextEditingController _EmergencyNumberEditingController = TextEditingController();
  final TextEditingController _AddressTextEditingController = TextEditingController();
  final TextEditingController _DistrictIdEditingController = TextEditingController();
  final TextEditingController _POBoxEditingController = TextEditingController();
  final TextEditingController _ZipCodeEditingController = TextEditingController();
  int? empId;
  _blind() {
    _displayviewModel.start();
    _displayviewModel.outputEmpBasicData.listen((data) async {
      final _useCase = instance<saveEmpBasicDataUseCase>();
      String userid= await _appPreferences.getUserToken();
       empId=await _appPreferences.getEmpIdToken();
      _saveViewModel= saveBDViewModel(_useCase,userid
      //,data.employee!,data.address!
       );
    });

    _ArabicNameEditingController.addListener(()
    {
    _saveViewModel!.setArabicName(_ArabicNameEditingController.text);
    }
    );
    _EnglishNameEditingController.addListener(() {
     _saveViewModel!.setEnglishName(_EnglishNameEditingController.text);
    });
    _BirthDateEditingController.addListener(() {
    _saveViewModel!.setBirthDate(_BirthDateEditingController.text);
    });
    _NationalIdEditingController.addListener(() {
     _saveViewModel!.setNationalId(_NationalIdEditingController.text);
    });
    _SocialIdEditingController.addListener(() {
     _saveViewModel!.setSocialId(_SocialIdEditingController.text);
    });
    _EmailEditingController.addListener(() {
    _saveViewModel!.setEmail(_EmailEditingController.text);
    });
    _PhoneEditingController.addListener(() {
    _saveViewModel!.setPhone(_PhoneEditingController.text);
    });
    _EmergencyNumberEditingController.addListener(() {
     _saveViewModel!.setEmergencyNumber(_EmergencyNumberEditingController.text);
    });
    _AddressTextEditingController.addListener(() {
      _saveViewModel!.setAddressText(_AddressTextEditingController.text);
    });
    _DistrictIdEditingController.addListener(() {
     _saveViewModel!.setDistrictId(int.parse(_DistrictIdEditingController.text));
    });
    _POBoxEditingController.addListener(() {
   _saveViewModel!.setPOBox(_POBoxEditingController.text);
    });
    _ZipCodeEditingController.addListener(() {
      _saveViewModel!.setZipCode(_ZipCodeEditingController.text);
    });
  }


  @override
  void initState() {
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

                    body: StreamBuilder<FlowState>(
                      stream: _displayviewModel.outputState,
                      builder: (context, snapshot){
                        return snapshot.data?.getScreenWidget(
                            context, _getContentWidget(),
                                () {
                              _displayviewModel.start();
                            },
                                () {
                            }) ?? _getContentWidget();
                      },
                    ),
                  ))
      );
  }
  @override
  void dispose() {
    _displayviewModel.dispose();
    super.dispose();
  }

  Widget _getContentWidget()
  {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*1.3,
                      padding: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _Formkey,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //ArabicName
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 28, right: 28),
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.ArabicName.tr(), textAlign: TextAlign.start,),
                                      StreamBuilder<BasicDataModel>(
                                        stream: _displayviewModel.outputEmpBasicData,
                                        builder: (context, snapshot) {
                                          return TextFormField(
                                            enabled: allowEdit,
                                                keyboardType: TextInputType.text,
                                                controller: _ArabicNameEditingController,
                                                decoration: InputDecoration(
                                                    hintText: snapshot.data?.employee
                                                        ?.arabicName?.toString()
                                                ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //EngishName
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 28,
                                        right: 28,
                                        bottom: 10),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.EnglishName.tr()),
                                        StreamBuilder<BasicDataModel>(
                                          stream: _displayviewModel.outputEmpBasicData,
                                          builder: (context, snapshot) {
                                            return TextFormField(
                                                enabled: allowEdit,
                                                //initialValue:snapshot.data?.employee?.englishName.toString() ,
                                                keyboardType: TextInputType.text,
                                                controller:
                                                _EnglishNameEditingController,
                                                decoration: InputDecoration(
                                                  hintText:
                                                  snapshot.data?.employee?.englishName
                                                      .toString(),


                                                  //labelText: AppStrings.englishName.tr(),

                                                  //errorText: snapshot.data
                                                ));
                                          },
                                        ),
                                      ],
                                    )
                                ),
                                //BirthDate
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 28,
                                      right: 28),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.BirthData.tr(), textAlign: TextAlign.start,),
                                      StreamBuilder<BasicDataModel>(
                                        stream: _displayviewModel.outputEmpBasicData,
                                        builder: (context, snapshot) {

                                          String? dateString = snapshot.data?.employee
                                              ?.birthdate.toString();
                                          if(birthDate == null) {
                                            if (dateString != null) {
                                              birthDate =
                                                  DateTime.parse(dateString);
                                            }
                                            else {
                                              // birthDate =
                                              //     DateTime.parse("dd/mm/yyyy");
                                            }
                                          }
                                          //birthDate = DateTime.parse(dateString!);
                                          return TextFormField(

                                              enabled: allowEdit,
                                              onTap: () async {
                                            DateTime? newDate = await
                                            showDatePicker
                                              (context: context,
                                                initialDate: birthDate!,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100));
                                            if (newDate == null) return;
                                            setState(() {
                                              date=birthDate;
                                              birthDate = newDate;
                                            date=newDate;
                                            });

                                          },
                                              keyboardType: TextInputType.text,
                                              controller: _BirthDateEditingController,
                                              decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.calendar_month),

                                                 // border: InputBorder.,
                                                  hintText:
                                                  "${birthDate!.day}/${birthDate!.month}/${birthDate!.year}"
                                                //labelText: AppStrings.nationalId.tr(),
                                                //errorText: snapshot.data
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //National Id
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 28,
                                      right: 28),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.NationalId.tr(), textAlign: TextAlign.start,),
                                      StreamBuilder<BasicDataModel>(
                                        stream: _displayviewModel.outputEmpBasicData,
                                        builder: (context, snapshot) {
                                          return TextFormField(
                                              enabled: allowEdit,
                                              keyboardType: TextInputType.text,
                                              controller: _NationalIdEditingController,
                                              decoration: InputDecoration(
                                                hintText: snapshot.data?.employee?.nationalId
                                                    .toString(),
                                                // labelText: AppStrings.socialId.tr(),
                                                //errorText: snapshot.data
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //social Id
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 28,
                                      right: 28),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.SocialId.tr(), textAlign: TextAlign.start,),
                                      StreamBuilder<BasicDataModel>(
                                        stream: _displayviewModel.outputEmpBasicData,
                                        builder: (context, snapshot) {
                                          return TextFormField(enabled: allowEdit,
                                              keyboardType: TextInputType.text,
                                              controller: _SocialIdEditingController,
                                              decoration: InputDecoration(
                                                hintText: snapshot.data?.employee?.socialId
                                                    .toString(),
                                                // labelText: AppStrings.socialId.tr(),
                                                //errorText: snapshot.data
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //Email
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.Email.tr(), textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,
                                            builder: (context, snapshot) {
                                              return TextFormField(
                                                  enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _EmailEditingController,
                                                  decoration: InputDecoration(
                                                    hintText: snapshot.data?.employee?.email
                                                        .toString(),
                                                    // labelText: AppStrings.email.tr(),
                                                    //errorText: snapshot.data
                                                  ));
                                            },
                                          ),
                                        ])),
                                //Phone
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.Phone.tr(), textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,
                                            builder: (context, snapshot) {
                                              return TextFormField(
                                                  enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _PhoneEditingController,
                                                  decoration: InputDecoration(
                                                    hintText: snapshot.data?.employee?.phone
                                                        .toString(),
                                                    //labelText: AppStrings.phone.tr(),
                                                    // errorText: snapshot.data
                                                  ));
                                            },
                                          ),
                                        ])),
                                //EmergencyNumber
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.EmergencyNumber.tr(), textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,
                                            builder: (context, snapshot) {
                                              return TextFormField(
                                                  enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _EmergencyNumberEditingController,
                                                  decoration: InputDecoration(
                                                    hintText: snapshot.data?.employee
                                                        ?.emergency_Number.toString(),
                                                    // labelText: AppStrings.emergencyNumber.tr(),
                                                    //  errorText: snapshot.data
                                                  ));
                                            },
                                          ),
                                        ])),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // country id //_getcountry
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              left: 28,
                                              right: 28),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(AppStrings.Country.tr(), textAlign: TextAlign.start,),
                                                StreamBuilder<BasicDataModel?>(
                                                  stream: _displayviewModel.outputEmpBasicData,
                                                  // stream: _saveViewModel.outputErrorPassword,
                                                  builder: (context, snapshot) {
                                                    int? selectedValue = snapshot.data
                                                        ?.selectedcountry;
                                                    return _getcountry(
                                                        snapshot.data?.country, selectedValue);
                                                  },
                                                ),
                                              ])),
                                      // Governorate
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              left: 28,
                                              right: 28),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppStrings.Governorate.tr(), textAlign: TextAlign.start,),
                                                StreamBuilder<BasicDataModel?>(
                                                  stream: _displayviewModel.outputEmpBasicData,
                                                  // stream: _saveViewModel.outputErrorPassword,
                                                  builder: (context, snapshot) {
                                                    int? selectedValue = snapshot.data
                                                        ?.selectedgovernorate;
                                                    return _getGovernorate(
                                                        snapshot.data?.governorate,
                                                        selectedValue);
                                                  },
                                                ),
                                              ])),

                                      ],
                                  ),
                                ),
                                // district
                                Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right:28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.District.tr(),textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,

                                            builder: (context, snapshot) {
                                              int? selectedValue=snapshot.data?.selecteddistrict!;
                                              return _getDistrict(snapshot.data?.district,selectedValue);

                                            },
                                          ),
                                        ])),
                                //Address
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.Address.tr(), textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,
                                            // stream: _saveViewModel.outputErrorPassword,
                                            builder: (context, snapshot) {
                                              var x = snapshot.data?.address;
                                              // String? AddressText = x?["AddressText"].toString();
                                              // String? a=AddressText!;

                                              return TextFormField(
                                                enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _AddressTextEditingController,
                                                  decoration: InputDecoration(
                                                      hintText: snapshot.data?.address?.addressText.toString(),
                                                    //labelText: AppStrings.addressText.tr(),
                                                    //errorText: snapshot.data
                                                  ));
                                            },
                                          ),
                                        ])),
                                //POBox
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.PoBox.tr(), textAlign: TextAlign.start,),
                                          StreamBuilder<BasicDataModel>(
                                            stream: _displayviewModel.outputEmpBasicData,
                                            builder: (context, snapshot) {
                                              return TextFormField(
                                                enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _POBoxEditingController,

                                                  decoration:InputDecoration(
                                                    hintText:snapshot.data?.address?.zipCode.toString(),

                                                  ));
                                            },
                                          ),
                                        ])),
                                //zipCode
                                Container(

                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 28,
                                        right: 28),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           Text(AppStrings.ZipCode.tr(), textAlign: TextAlign.start,
                                           ),
                                           StreamBuilder<BasicDataModel?>(
                                            // stream: _displayviewModel.outputEmpBasicData,
                                            stream: _displayviewModel.outputEmpBasicData,
                                            builder: (context, snapshot) {
                                              return TextFormField(
                                                  enabled: allowEdit,
                                                  keyboardType: TextInputType.text,
                                                  controller: _ZipCodeEditingController,
                                                  decoration: InputDecoration(
                                                    hintText: snapshot.data?.address?.zipCode.toString(),
                                                    //  labelText: AppStrings.zipCode.tr(),
                                                    // errorText: snapshot.data
                                                  ));
                                            },
                                          ),
                                        ])),
                              ],
                            ),
                          ),
                        ),
                      ),
                  Container(
                  padding: EdgeInsets.all(20),
                  child: StreamBuilder<BasicDataModel?>(
                  stream: _displayviewModel.outputEmpBasicData,
                  builder: (context, snapshot) {
                    if (snapshot.data?.allowEdit == false) {
                      allowEdit=false;
                      return Container();
                    }
                    else {
                      allowEdit=true;
                      return
                        ElevatedButton(
                            child: Text("Save"),
                            onPressed: () async {
                              _saveViewModel!.SaveBasicData(
                                  empId!,
                                  _ArabicNameEditingController.text.toString(),
                                  _EnglishNameEditingController.text.toString(),
                                  date.toString(),
                                  _NationalIdEditingController.text.toString(),
                                  _SocialIdEditingController.text.toString(),
                                  _EmailEditingController.text.toString(),
                                  _PhoneEditingController.text.toString(),
                                  _EmergencyNumberEditingController.text
                                      .toString(),
                                  _AddressTextEditingController.text.toString(),
                                  districtId!,
                                  _POBoxEditingController.text.toString(),
                                  _ZipCodeEditingController.text.toString());
                              displayDialoge();
                            }
                          // : null,
                        );
                    }
                  })

                                    )]),
    );
  }
  Widget _getcountry(List<CountryModel>? country, int? selectedValue) {
    if (selectedValue == null && country![0].countryId != null) {
      selectedValue = country[0].countryId;
      countryId =selectedValue;
    }

    countryId =selectedValue;
    var items = country?.map(
            (countryItem) {
          return DropdownMenuItem(

            value: countryItem.countryId,
            child: Text(countryItem.countryName.toString()),);
        }).toList();
    return DropdownButton(
      hint: Text(AppStrings.Choose_Country.tr()),
      items: items,
      //enableFeedback: ,
      onChanged: (newvalue) {allowEdit! ?
      setState(() {
        countryId = newvalue;
      }):null;
      },
      value: countryId,
    );
  }
  Widget _getGovernorate(List<GovernorateModel>? governorate, int? selectedValue) {
    selectedValue ??= governorate![0].governorateId;
    governorateId=selectedValue;
    var items = governorate?.map(
            (governorateItem) {
          return DropdownMenuItem(

            value: governorateItem.governorateId,
            child: Text(governorateItem.governorateName.toString()),);
        }).toList();
    return DropdownButton(
      hint: Text(AppStrings.Choose_Governorate.tr()),
      items: items,

      //enableFeedback: ,
      onChanged: (newValue) {
      setState(() {
        governorateId = newValue;
      });
      },
      value: governorateId,
    );
  }
  Widget _getDistrict(List<DistrictsModel>? districts, int? selectedValue) {
    selectedValue ??= districts![0].districtId;
    //districtId=selectedValue;

    if(firstSelect==0){
      districtId=selectedValue;
    }
    var items = districts?.map(
            (districtItem) {
          return DropdownMenuItem(

            value: districtItem.districtId,
            child: Text(districtItem.districtName.toString()),);
        }).toList();
    return DropdownButton(
      hint: Text(AppStrings.Choose_District.tr()),
      items: items,
      //enableFeedback: ,
      onChanged: (newvalue) {
        firstSelect=1;
      setState(() {

        districtId = newvalue;
      });
      },
      value: districtId,
    );
    // return DropdownButton(
    //   value: selectedValue,
    //   items: districts?.map(
    //           (DistrictItems) {
    //         return DropdownMenuItem(
    //           child: Text(DistrictItems.districtName!.toString()),
    //           value: DistrictItems.districtId,);
    //       }).toList(),
    //   onChanged: (Object? value) {
    //     selectedValue = value as int;
    //   },
    //
    // );
  }

  Widget? displayDialoge() {
    showAnimatedDialog(
      context: context,

      // builder: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: "",
          contentText: AppStrings.Was_Saved_Successfully.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fade, curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
  }
}




