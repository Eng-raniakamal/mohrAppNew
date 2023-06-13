
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import '../../../application/app_prefs.dart';
import '../../../application/constants.dart';
import '../../../domain/model/navigationManu.dart';
import '../../common/state_renderer/state_render_impl.dart';
import '../../resources/strings_manager.dart';
import '../../widgets/appbarMain.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/profile_widget.dart';
import 'empBasicData_view.dart';
import 'empSkills_view.dart';


class EmployeeEditView extends StatefulWidget with NavigationStates{
  const EmployeeEditView({Key? key}) : super(key: key);

  @override
  State<EmployeeEditView> createState() => _EmployeeEditViewState();
}

class _EmployeeEditViewState extends State<EmployeeEditView>with TickerProviderStateMixin {


  //final EmployeeBasicDataViewModel _viewModel=instance<EmployeeBasicDataViewModel>();
  //final AppPreferences _appPreferences = instance<AppPreferences>();
  final _Formkey= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final TabController _tabController=
    TabController(length: (2),vsync:this);
    return
      ThemeSwitchingArea(
          child: Builder(
              builder: (context) =>
                  Scaffold(
                    appBar: buildAppBarMain(context),
                    backgroundColor: colorManager.white,
                    body:
                    Column(
                      children: [
                      Expanded(
                         flex: 1,
                         child:
                            Container(
                                 padding: EdgeInsets.only(top:30),
                               child: SingleChildScrollView(
                                 child: Form(
                                    key: _Formkey,
                                   child: Column(
                                      children: [
                                        ProfileWidget(
                                            imagePath: Constants.imagePath,
                                            isEdit: true,
                                            onClicked: () {showImagePicker(context);},
                                       ),
                                        //const SizedBox(height: 20),
                                        Container(//child:Align(
                                          alignment: Alignment.center,
                                          width: 250,
                                          //height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(25.0,)),
                                          child: TabBar(

                                            controller: _tabController,
                                            isScrollable: true,
                                            //labelPadding: const EdgeInsets.only(left: 20,right: 20),
                                            labelColor: colorManager.primary,
                                            unselectedLabelColor:  colorManager.white,
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                25.0,
                                              ),
                                              color: colorManager.greywithOpacity,

                                            ),
                                            //labelColor: Colors.white,
                                            //unselectedLabelColor: Colors.black,

                                            tabs:const [Tab(text:"Basic Data"),Tab(text:"Skills")],
                                          ),
                                        ),
                                 ]
                                   )
                                 )
                               )
                            ),
               ),
                                         //SizedBox(height: 24),

      //                 Expanded(
      //                   flex: 1,
      //                   child:
      //                      Container(//child:Align(
      //                                      alignment: Alignment.center,
      //                                      width: 250,
      //                                      //height: 20,
      //                                      decoration: BoxDecoration(
      //                                       //color: Colors.grey[300],
      //                                      borderRadius: BorderRadius.circular(25.0,)),
      //                                    child: TabBar(
      //
      //       controller: _tabController,
      //       isScrollable: true,
      //       //labelPadding: const EdgeInsets.only(left: 20,right: 20),
      //       labelColor: colorManager.primary,
      //       unselectedLabelColor:  colorManager.white,
      //             indicator: BoxDecoration(
      //               borderRadius: BorderRadius.circular(
      //                 25.0,
      //               ),
      //               color: colorManager.greywithOpacity,
      //
      //             ),
      //             //labelColor: Colors.white,
      //             //unselectedLabelColor: Colors.black,
      //
      //                                     tabs:const [Tab(text:"Basic Data"),Tab(text:"Skills")],
      //     ),
      //   ),
      // ),

                     Expanded(
                      flex: 2,
                      child:  Container(
                                               width:double.maxFinite,
                                                height: 500,
                                          child:TabBarView(
                                           controller: _tabController,
                                           children: const [
                                            EmployeeBasicDataView(),
                                            EmployeeSkillsView()
          ],
        )
      )


  ,
                    )],
               ),

                    ))
          );


  }

}
