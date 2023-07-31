import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mohr_hr/application/app_prefs.dart';
import 'package:mohr_hr/application/constants.dart';
import 'package:mohr_hr/application/di.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:mohr_hr/presentation/User/editProfileScreen.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/User/User_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/settings/settings_Screen.dart';
import 'package:mohr_hr/presentation/splash/splashScreen.dart';
import 'package:mohr_hr/presentation/widgets/IconButtonWidgets.dart';
//import 'package:mohr_hr/User/editProfileScreen.dart';
import 'package:mohr_hr/presentation/widgets/appbarMain.dart';
import 'package:mohr_hr/presentation/widgets/button_widget.dart';
import 'package:mohr_hr/presentation/widgets/clipPathWidget.dart';
import 'package:mohr_hr/presentation/widgets/profile_widget.dart';
import 'package:mohr_hr/presentation/Requests/Vacations/view/vactions_view.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../domain/model/navigationManu.dart';
import '../editEmployee/View/empSkills_view.dart';
import '../resources/assets_manager.dart';
import '../resources/routes.dart';




final items=<Widget>
[ const Icon(Icons.person,size: 30,),
  const Icon(Icons.home,size: 30,),
  const Icon(Icons.notifications,size: 30,),

];
class userView extends StatefulWidget with NavigationStates{
  const userView({Key? key}) : super(key: key);
  @override
  _userViewState createState() =>_userViewState();
}

class _userViewState extends State<userView> {
  final EmployeeViewModel _viewModel = instance<EmployeeViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return
                  snapshot.data?.getScreenWidget(
                      context, _getContentWidget(),
                          () {_viewModel.start();}) ??
                      Container();
            }
        )
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBarMain(context),
      bottomNavigationBar:
      CurvedNavigationBar(items: items,
        index: 1,
        buttonBackgroundColor: colorManager.lightprimary,
        backgroundColor: Colors.transparent,
        color: colorManager.lightprimary,
        onTap: (int index) {
          if(index==1)
          {
            Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
          }
          else
          if(index==0)
          {
            Navigator.of(context).pushReplacementNamed(Routes.employee);
          }
          }
      ),
      body:
          ListView(
                physics: const BouncingScrollPhysics(),
                children: [

                  StreamBuilder<EmployeeDataModel>(
                      stream: _viewModel.outputUserData,
                      builder: (context, snapshot) {
                        return
                           Column(
                                children: [
                                  Stack(
                                      children: [
                                        const SizedBox(width: 10, height: 10,),
                                        const clipPathWidgets(),
                                        const SizedBox(width: 10, height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Expanded(
                                                  flex: 2,

                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        left: 30.0, bottom: 10),
                                                      child: _getEmployeeDataWidget(
                                                        snapshot.data),
                                                  )

                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child:
                                                  SizedBox(width: 20, child:
                                                  _getImageWidget(
                                                      snapshot.data),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(height: 20),
                                ]
                            )
                          ;
                      }),
                      const SizedBox(height: 10,),
                      Container(
                            child: Column(children:[

                             Row(children:[
                            //SizedBox(width:5),
                              Center(child:SizedBox(width: 200,
                                child:
                               buildUpgradeButton(AppStrings.Vacation.tr(),colorManager.greywithOpacity))),
                              Center(child:SizedBox(width: 200,
                                child:
                                buildUpgradeButton(AppStrings.Salary.tr(),colorManager.lightprimary),
                            ))]),
                              const SizedBox(height: 70),
                             Row(children:[
                              Center(child:SizedBox(width: 200,
                                  child:

                                  buildUpgradeButton(AppStrings.Attendance.tr(),colorManager.lightprimary))),

                              Center(child:SizedBox(width: 200,
                                  child:

                                  buildUpgradeButton(AppStrings.Request.tr(),colorManager.lightprimary),

                              )
                              )
                             ]),

    ]),


                        ),

    ]),
    );


  }

  Widget buildUpgradeButton(String ReqName,Color bgColor) {

    switch (ReqName) {
      case "Vacation Request":
        return Hero(
              tag: ReqName,
              transitionOnUserGestures: true,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.Vacations);
                  },
                  child: Column(
                    children: const [
                      SizedBox(width: 70,height: 70,
                        child: Image(image: AssetImage(ImageAssets.Vacation),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text("Vacation")
                    ],
                  )
              )

        );
      case "Salary":
        return Hero(
            tag: ReqName,
            transitionOnUserGestures: true,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.salary);
                },
                child: Column(
                  children:const [
                     SizedBox(width: 70,height: 70,
                       child: Image(image: AssetImage(ImageAssets.salary),
                        fit: BoxFit.contain,
                    ),
                     ),
                    Text("Salary")
                  ],
                )
            )
        );
      case "Attendance":
        return Hero(
            tag: ReqName,
            transitionOnUserGestures: true,
            child: InkWell(
                onTap: () {

                },
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:const [
                     SizedBox(width: 70,height: 70,
                       child: Image(image: AssetImage(ImageAssets.attendance),
                       fit: BoxFit.contain,
                    ),
                     ),
                    SizedBox(width: 80,height: 70,child: Text("Attendance"))
                  ],
                )
            )
        );
      case "Request":
        return Hero(
            tag: ReqName,
            transitionOnUserGestures: true,
            child: InkWell(
                onTap: () {
                },
                child: Column(
                  children:const [
                    SizedBox(width: 70,height: 70,
                      child: Image(image: AssetImage(ImageAssets.requests),
                        fit: BoxFit.contain,
                      ),
                    ),
                  SizedBox(width:70,height: 70,child: Text("Requests"))
                  ],
                )
            )
        );
      default:
        return Container();
    }
  }


  Widget? buildcountanir(String reqName) {
    Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag:reqName,
            child:
            ButtonWidget(buttonBgColor: colorManager.lightprimary,
              text: reqName,
              onClicked: () {

              },
            ),

          )
        ],
      ),
    );
  }
  Widget _getEmployeeDataWidget(EmployeeDataModel? userData) {
    if (userData != null) {
      var empData = userData.userDataModel;
      String Name;
      if(_appPreferences.getAppLanguage()=="ENGLISH")
        {
       Name=empData.EnglishName.toString();}
      else
        {
          Name=empData.EnglishName.toString();
        }
      String Email=empData.UserName.toString();
      String Code=empData.EmployeeCode.toString();
     return Column(
          children: [
           Text(Name,
           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,
               color: colorManager.white),
    ),
           const SizedBox(height: 4),
          Text(Email,
           style: const TextStyle(color: colorManager.white),
        ),
           const SizedBox(height: 4),
          Text(Code,
            style: const TextStyle(color: colorManager.white),)],
     );}
    else
      {
        return Container();
      }
    }
  Widget _getImageWidget(EmployeeDataModel? userData) {
    if (userData != null) {
     var empData = userData.userDataModel.masterImage;
    String? URLimage= empData?["Url"].toString();
    Constants.imagePath=URLimage!;
    //Constants.canUpload!=empData?["CanUploadMasterImage"];
    bool canEditImage=empData?["CanUploadMasterImage"];
     // String imagePath=" ";
     return ProfileWidget(
          imagePath: URLimage!,
          onClicked: () {
            // if(canEditImage == true)
            // {
            //   displayDialoge();
            // }
            // else
            //   {
                resetModules();
                Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
             // }
          }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => editProfileScreen()),
      );
    }
    else {
      return Container();
    }
  }


  Widget _buildItemList(BuildContext context, int index)
  {
    return Container(

        child:Column(
           mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Container(
                  color:Colors.orange,
                  width:50,
                  height:50,
                  child:Center(
                      child:Text("${Constants.Rlist[index]}")
                  )
              )
            ]
        )
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  Widget? displayDialoge()
  {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Information',
          contentText: 'Sorry,You do not have  permission to change your Photo',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.fade
      ,curve: Curves.linear,
      duration: const Duration(seconds: 1),
    );
  }

}




