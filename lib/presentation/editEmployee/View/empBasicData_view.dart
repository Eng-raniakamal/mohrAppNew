
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/domain/usecase/saveEmpBD_useCase.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpBasicData_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';




class BasicDataView extends StatefulWidget {
  const BasicDataView({Key? key}) : super(key: key);

  @override
  BasicDataViewState createState() => BasicDataViewState();
}

class BasicDataViewState extends State<BasicDataView> {

  final EmployeeBasicDataViewModel displayViewModel = instance<EmployeeBasicDataViewModel>();
  saveBDViewModel? _saveViewModel;// =instance<saveBDViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final formKey = GlobalKey<FormState>();
  DateTime? birthDate;
  DateTime? date1;
  DateTime date = DateTime(2023);
  bool? allowEdit;
  int? countryId;
  int? governorateId;
  int? districtId;
  int firstSelect =0;
  //
  final TextEditingController _arabicNameEditingController = TextEditingController();
  final TextEditingController _englishNameEditingController = TextEditingController();
  final TextEditingController _nationalIdEditingController = TextEditingController();
  final TextEditingController _birthDateEditingController = TextEditingController();
  final TextEditingController _socialIdEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _emergencyNumberEditingController = TextEditingController();
  final TextEditingController _addressTextEditingController = TextEditingController();
  final TextEditingController _districtIdEditingController = TextEditingController();
  final TextEditingController _pOBoxEditingController = TextEditingController();
  final TextEditingController _zipCodeEditingController = TextEditingController();
  int? empId;

  _blind() {
    displayViewModel.start();
    displayViewModel.outputEmpBasicData?.listen((data) async {
      final useCase = instance<saveEmpBasicDataUseCase>();
      String userid= await _appPreferences.getUserToken();
      empId=await _appPreferences.getEmpIdToken();
      _saveViewModel= saveBDViewModel(useCase,userid
        //,data.employee!,data.address!
      );
    });

    _arabicNameEditingController.addListener(()
    {
      _saveViewModel!.setArabicName(_arabicNameEditingController.text);
    }
    );
    _englishNameEditingController.addListener(() {
      _saveViewModel!.setEnglishName(_englishNameEditingController.text);
    });
    _birthDateEditingController.addListener(() {
      _saveViewModel!.setBirthDate(_birthDateEditingController.text);
    });
    _nationalIdEditingController.addListener(() {
      _saveViewModel!.setNationalId(_nationalIdEditingController.text);
    });
    _socialIdEditingController.addListener(() {
      _saveViewModel!.setSocialId(_socialIdEditingController.text);
    });
    _emailEditingController.addListener(() {
      _saveViewModel!.setEmail(_emailEditingController.text);
    });
    _phoneEditingController.addListener(() {
      _saveViewModel!.setPhone(_phoneEditingController.text);
    });
    _emergencyNumberEditingController.addListener(() {
      _saveViewModel!.setEmergencyNumber(_emergencyNumberEditingController.text);
    });
    _addressTextEditingController.addListener(() {
      _saveViewModel!.setAddressText(_addressTextEditingController.text);
    });
    _districtIdEditingController.addListener(() {
      _saveViewModel!.setDistrictId(int.parse(_districtIdEditingController.text));
    });
    _pOBoxEditingController.addListener(() {
      _saveViewModel!.setPOBox(_pOBoxEditingController.text);
    });
    _zipCodeEditingController.addListener(() {
      _saveViewModel!.setZipCode(_zipCodeEditingController.text);
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
                      stream: displayViewModel.outputState,
                      builder: (context, snapshot){
                        if(snapshot.hasData) {
                          return snapshot.data?.getScreenWidget(
                              context, _getContentWidget(),
                                  () {
                                displayViewModel.start();
                              },
                                  () {}) ?? _getContentWidget();
                        }
                        else{ return  Container();}
                      },
                    ),
                  ))
      );
  }
  // bool _isdispose=false;
  @override
  void dispose() {
    displayViewModel.dispose();
   // _isdispose=true;
    super.dispose();
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*3.5,
              padding: const EdgeInsets.only(top: 20),
              child: Form(
                key: formKey,
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
                            StreamBuilder<BasicDataModel?>(
                              stream: displayViewModel.outputEmpBasicData,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    enabled: allowEdit,
                                    keyboardType: TextInputType.text,
                                    controller: _arabicNameEditingController,
                                    decoration: InputDecoration(
                                        hintText: snapshot.data?.employee
                                            ?.arabicName?.toString()
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                      //EnglishName
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
                                stream: displayViewModel.outputEmpBasicData,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                      enabled: allowEdit,
                                      //initialValue:snapshot.data?.employee?.englishName.toString() ,
                                      keyboardType: TextInputType.text,
                                      controller:
                                      _englishNameEditingController,
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
                            StreamBuilder<BasicDataModel?>(
                              stream: displayViewModel.outputEmpBasicData,
                              builder: (context, snapshot) {
                                String? dateString = snapshot.data?.employee
                                    ?.birthdate.toString();
                                if(birthDate == null) {
                                  if (dateString != null) {
                                    birthDate = DateTime.parse(dateString);
                                  }
                                  else {
//                                               birthDate =
//                                                   DateTime.parse("dd/mm/yyyy");
                                  }
                                }
                                //birthDate = DateTime.parse(dateString!);
                                return TextFormField(
                                    enabled: allowEdit,
                                    onTap: () async {
                                      DateTime? newDate = await
                                      showDatePicker
                                        (context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100));
                                      if (newDate == null) return;
                                      setState(() {
                                        date=birthDate!;
                                        birthDate = newDate;
                                        date=newDate;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _birthDateEditingController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.calendar_month),
                                        // border: InputBorder.,
                                        hintText:
                                        "${birthDate?.day}/${birthDate?.month}/${birthDate?.year}"
                                      //labelText: AppStrings.nationalId.tr(),
                                      //errorText: snapshot.data
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
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
                              stream:displayViewModel.outputEmpBasicData,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    enabled: allowEdit,
                                    keyboardType: TextInputType.text,
                                    controller: _nationalIdEditingController,
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
                              stream: displayViewModel.outputEmpBasicData,
                              builder: (context, snapshot) {
                                return TextFormField(enabled: allowEdit,
                                    keyboardType: TextInputType.text,
                                    controller: _socialIdEditingController,
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
                                  stream: displayViewModel.outputEmpBasicData,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.text,
                                        controller: _emailEditingController,
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
                                  stream: displayViewModel.outputEmpBasicData,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.text,
                                        controller: _phoneEditingController,
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
                                  stream: displayViewModel.outputEmpBasicData,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.text,
                                        controller: _emergencyNumberEditingController,
                                        decoration: InputDecoration(
                                          hintText: snapshot.data?.employee
                                              ?.emergency_Number.toString(),
                                          // labelText: AppStrings.emergencyNumber.tr(),
                                          //  errorText: snapshot.data
                                        ));
                                  },
                                ),
                              ])),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       // country id
                      //       Container(
                      //           padding: const EdgeInsets.only(
                      //               top: 12,
                      //               left: 28,
                      //               right: 28),
                      //           child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(AppStrings.Country.tr(), textAlign: TextAlign.start,),
                      //                 StreamBuilder<BasicDataModel?>(
                      //                   stream: displayViewModel.outputEmpBasicData,
                      //                   // stream: _saveViewModel.outputErrorPassword,
                      //                   builder: (context, snapshot) {
                      //                     if(snapshot.hasData) {
                      //                       int? selectedValue = snapshot.data
                      //                           ?.selectedcountry;
                      //                       return _getCountry(
                      //                           snapshot.data?.country,
                      //                           selectedValue);
                      //                     }
                      //                     else{
                      //                       return _getCountry(
                      //                         snapshot.data?.country,
                      //                         0);}
                      //                     },
                      //                 ),
                      //               ])),
                      //       // Governorate
                      //       Container(
                      //           padding: const EdgeInsets.only(
                      //               top: 12,
                      //               left: 28,
                      //               right: 28),
                      //           child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   AppStrings.Governorate.tr(), textAlign: TextAlign.start,),
                      //                 StreamBuilder<BasicDataModel>(
                      //                   stream: displayViewModel.outputEmpBasicData!,
                      //                   // stream: _saveViewModel.outputErrorPassword,
                      //                   builder: (context, snapshot) {
                      //                     if(snapshot.hasData) {
                      //                       int? selectedValue = snapshot.data
                      //                           ?.selectedgovernorate;
                      //                       return _getGovernorate(
                      //                           snapshot.data?.governorate,
                      //                           selectedValue);
                      //                     }
                      //                     else{
                      //                       return _getGovernorate(
                      //                           snapshot.data?.governorate,
                      //                           0);
                      //                     }
                      //                   },
                      //                 ),
                      //               ])),
                      //
                      //     ],
                      //   ),
                      // ),
                      // // district
                      // Container(
                      //   //alignment: Alignment.topLeft,
                      //     padding: const EdgeInsets.only(
                      //         top: 15,
                      //         left: 28,
                      //         right:28),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Text(AppStrings.District.tr(),textAlign: TextAlign.start,),
                      //           StreamBuilder<BasicDataModel>(
                      //             stream: displayViewModel.outputEmpBasicData,
                      //
                      //             builder: (context, snapshot) {
                      //               int? selectedValue=snapshot.data?.selecteddistrict!;
                      //               return _getDistrict(snapshot.data!.district!,selectedValue);
                      //
                      //             },
                      //           ),
                      //         ])),
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
                                  stream: displayViewModel.outputEmpBasicData,
                                  // stream: _saveViewModel.outputErrorPassword,
                                  builder: (context, snapshot) {
                                    //  var x = snapshot.data?.address;
                                    // String? AddressText = x?["AddressText"].toString();
                                    // String? a=AddressText!;

                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.text,
                                        controller: _addressTextEditingController,
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
                                  stream:displayViewModel.outputEmpBasicData,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.number,
                                        controller: _pOBoxEditingController,

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
                                Text(AppStrings.zipCode.tr(), textAlign: TextAlign.start,
                                ),
                                StreamBuilder<BasicDataModel?>(
                                  // stream: _displayViewModel.outputEmpBasicData,
                                  stream: displayViewModel.outputEmpBasicData,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        enabled: allowEdit,
                                        keyboardType: TextInputType.number,
                                        controller: _zipCodeEditingController,
                                        decoration: InputDecoration(
                                          hintText: snapshot.data?.address?.zipCode.toString(),
                                          //  labelText: AppStrings.zipCode.tr(),
                                          // errorText: snapshot.data
                                        ));
                                  },
                                ),
                              ])),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            child: StreamBuilder<BasicDataModel?>(
                                stream: displayViewModel.outputEmpBasicData,
                                builder: (context, snapshot) {
                                  if (snapshot.data?.allowEdit == false) {
                                    allowEdit=false;
                                    return Container();
                                  }
                                  else {
                                    allowEdit=true;
                                    return
                                      ElevatedButton(
                                          child: Text(AppStrings.save.tr()),
                                          onPressed: () async {
                                            _saveViewModel!.SaveBasicData(
                                                empId!,
                                                _arabicNameEditingController.text.toString(),
                                                _englishNameEditingController.text.toString(),
                                                date.toString(),
                                                _nationalIdEditingController.text.toString(),
                                                _socialIdEditingController.text.toString(),
                                                _emailEditingController.text.toString(),
                                                _phoneEditingController.text.toString(),
                                                _emergencyNumberEditingController.text
                                                    .toString(),
                                                _addressTextEditingController.text.toString(),
                                                2,
                                                _pOBoxEditingController.text.toString(),
                                                _zipCodeEditingController.text.toString());
                                            displayDialog();
                                          }
                                        // : null,
                                      );
                                  }
                                })

                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ]),
    );
  }


  Widget _getCountry(List<CountryModel>? country, int? selectedValue) {
    if ((selectedValue == 0 || selectedValue == null)  &&
        country![0].countryId != null) {

      var items = country.map(
              (countryItem) {
            return DropdownMenuItem(
              value: countryItem.countryId,
              child: Text(countryItem.countryName.toString()),);
          }).toList();
      return DropdownButton(
        hint: Text(AppStrings.Choose_Country.tr()),
        items: items,
        //enableFeedback: ,
        onChanged: (newValue) {allowEdit! ?
        setState(() {
          countryId = newValue;
        }):null;
        },
        value: countryId,
      );
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
      onChanged: (newValue) {allowEdit! ?
      setState(() {
        countryId = newValue;
      }):null;
      },
      value: countryId,
    );
  }
  Widget _getGovernorate(List<GovernorateModel>? governorate, int? selectedValue) {

    List<GovernorateModel>? governorateList;

    governorateList= [
      for (var item in governorate!)
        if(countryId == item.countryId)
          GovernorateModel(item.governorateId,item.governorateName,item.countryId)
    ];

    if ((selectedValue == 0 || selectedValue == null) &&
        governorate[0].governorateId != null) {
      //governorateId=selectedValue;
      var items = governorateList.map(
              (governorateItem) {
            return DropdownMenuItem(
              value: governorateItem.governorateId,
              child: Text( governorateItem.governorateName.toString()),);
          }).toList();


      return DropdownButton(
        hint: Text(AppStrings.Choose_Governorate.tr()),
        items: items,

        //enableFeedback: ,
        onChanged: (newValue) {
          allowEdit! ?
          setState(() {
            governorateId = newValue;
          }) : null;
        },
        value: governorateId,
      );

    }
setState(() {
    governorateId=selectedValue;
});

    var items = governorateList.map(
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
        allowEdit! ?
        setState(() {
          governorateId = newValue;
        }) : null;
      },
      value: governorateId,
    );

  }
  Widget _getDistrict(List<DistrictsModel> districts, int? selectedValue) {
    //selectedValue ??= districts![0].districtId;
    //districtId=selectedValue;

    List<DistrictsModel> districtsList;

    districtsList = [
      for (var item in districts)
        if(governorateId == item.governorateId)
          DistrictsModel(
            item.districtId, item.districtName, item.governorateId,)
    ];


    if (firstSelect == 0) {
      districtId = selectedValue;
    }


    if ((selectedValue == 0 || selectedValue == null) &&
        districts[0].districtId != null) {
      var items = districtsList.map(
              (districtItem) {
            return DropdownMenuItem(
              value: districtItem.districtId,
              child: Text(districtItem.districtName.toString()),);
          }).toList();
      return DropdownButton(
        hint: Text(AppStrings.Choose_District.tr()),
        items: items,
        //enableFeedback: ,
        onChanged: (newValue) {
          firstSelect = 1;
          allowEdit! ?
          setState(() {
            districtId = newValue;
          }) : null;
        },
        value: districtId,
      );
    }
    //setState(() {
    governorateId=selectedValue;
//});

    var items = districtsList.map(
            (districtItem) {
          return DropdownMenuItem(
            value: districtItem.districtId,
            child: Text(districtItem.districtName.toString()),);
        }).toList();
    return DropdownButton(
      hint: Text(AppStrings.Choose_District.tr()),
      items: items,

      //enableFeedback: ,
      onChanged: (newValue) {
        allowEdit! ?
        setState(() {
          districtId = newValue;
        }) : null;
      },
      value: districtId,
    );


  }



  Widget? displayDialog() {
    showAnimatedDialog(
      context: context,

      // builder: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: "",
          positiveText: AppStrings.confirm.tr(),
          contentText: AppStrings.Was_Saved_Successfully.tr(),
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fade, curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
    return null;
  }

}




