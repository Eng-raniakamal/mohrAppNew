
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

class EmployeeSkillsView extends StatefulWidget {
  const EmployeeSkillsView({Key? key}) : super(key: key);

  @override
  State<EmployeeSkillsView> createState() => _EmployeeSkillsViewState();
}

class _EmployeeSkillsViewState extends State<EmployeeSkillsView> {

  final EmployeeSkillsViewModel _viewModel=instance<EmployeeSkillsViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();

  final TextEditingController _DateEditingController= TextEditingController();
  final TextEditingController _GradeIdEditingController=TextEditingController();
  final TextEditingController _QualificationIdEditingController=TextEditingController();
  final TextEditingController _EmployeeIdEditingController=TextEditingController();

  _blind() {
    _viewModel.start();
    _DateEditingController.addListener(() {
      _viewModel.setDate(_DateEditingController.text);
    });
    _GradeIdEditingController.addListener(() {
      _viewModel.setGradeId(int.parse(_GradeIdEditingController.text));
    });
    _QualificationIdEditingController.addListener(() {
      _viewModel.setQualificationId(int.parse(_QualificationIdEditingController.text));
    });
    _EmployeeIdEditingController.addListener(() {
      _viewModel.setEmployeeId(int.parse(_EmployeeIdEditingController.text));


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
                              _viewModel.addSkills();
                            }) ??
                            _getContentWidget();
                      },
                    ),
                  ))
      );
  }

  Widget _getTabWidget(){
    return
    SizedBox(
      height: 50,
      child: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.account_box),text: "Basic Data"
            ),
            Tab(
              icon: Icon(Icons.abc,),text: "Skills"),
          ],
        ),
      ),
    );

  }

  Widget _getContentWidget() {
    return Container(
        padding: EdgeInsets.only(top:30),
        child: SingleChildScrollView(
          child: Form(
            key: _Formkey,
            child: Column(
              children: [
              // ProfileWidget(
              //  imagePath: Constants.imagePath,
              //  isEdit: true,
              // onClicked: () async {},
              // ),
//                const SizedBox(height: 24),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 28, right: 28),
                  child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorDate,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _DateEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.date.tr(),
                              labelText: AppStrings.date.tr(),
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
                        bottom: 12
                    ),

                            child: StreamBuilder<String?>(
                             // stream: _viewModel.outputErrorMobileNumber,
                              builder: (context, snapshot) {
                                return TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller:
                                    _GradeIdEditingController,
                                    decoration: InputDecoration(
                                        hintText: AppStrings.grade.tr(),
                                        labelText: AppStrings.grade.tr(),
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
                          keyboardType: TextInputType.number,
                          controller: _QualificationIdEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.qualification.tr(),
                              labelText: AppStrings.qualification.tr(),
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
                          controller: _EmployeeIdEditingController,
                          decoration: InputDecoration(
                              hintText: AppStrings.employee.tr(),
                              labelText: AppStrings.employee.tr(),
                              errorText: snapshot.data));
                    },
                  ),
                ),
                const SizedBox(height:28),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 28, right: 28),
                    child: StreamBuilder<bool>(
                      //stream: _viewModel.outputIsAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height:40,
                          child: ElevatedButton(
                              // onPressed: (snapshot.data ?? false)
                              //     ? () {
    onPressed: () {
                                _viewModel.addSkills();
                              },
                                 // : null,
                              child: const Text(AppStrings.addSkills).tr()),
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
