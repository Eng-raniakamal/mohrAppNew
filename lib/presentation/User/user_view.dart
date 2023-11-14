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
import 'package:mohr_hr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';
import 'package:mohr_hr/presentation/User/editProfileScreen.dart';
import 'package:mohr_hr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mohr_hr/presentation/User/User_viewModel.dart';
import 'package:mohr_hr/presentation/resources/colors.dart';
import 'package:mohr_hr/presentation/resources/strings_manager.dart';
import 'package:mohr_hr/presentation/settings/settings_Screen.dart';
import 'package:mohr_hr/presentation/splash/splashScreen.dart';
import 'package:mohr_hr/presentation/underConstraction.dart';
import 'package:mohr_hr/presentation/widgets/IconButtonWidgets.dart';
//import 'package:mohr_hr/User/editProfileScreen.dart';
import 'package:mohr_hr/presentation/widgets/appbarMain.dart';
import 'package:mohr_hr/presentation/widgets/appbar_widget.dart';
import 'package:mohr_hr/presentation/widgets/button_widget.dart';
import 'package:mohr_hr/presentation/widgets/clipPathWidget.dart';
import 'package:mohr_hr/presentation/widgets/navigator_bar.dart';
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
  final EmployeeImageViewModel _imageViewModel = instance<EmployeeImageViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  //LocalDataSource _localDataSource = instance<LocalDataSource>();
  bool canEditImage=true;

  _bind(){

    _viewModel.start();
    _imageViewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
        builder: (context) =>
        Scaffold(
            extendBodyBehindAppBar: true,
            appBar: buildAppBar(context),
            bottomNavigationBar:NavigatorBar(index: 1),
            // CurvedNavigationBar(items: items,
            //     index: 1,
            //     buttonBackgroundColor: colorManager.primary,
            //     backgroundColor: Colors.transparent,
            //     color: colorManager.primary,
            //     onTap: (int index) {
            //       if(index==1)
            //       {
            //         Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
            //       }
            //       else
            //       if(index==0)
            //       {
            //         Navigator.of(context).pushReplacementNamed(Routes.employee);
            //       }
            //       else
            //         if(index==2)
            //           {
            //             Navigator.of(context).pushReplacementNamed(Routes.notification);
            //           }
            //     }
            // ),
            body:
        StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return
                  snapshot.data?.getScreenWidget(
                      context, _getContentWidget(),
                          () {_viewModel.start();},
                          () {
                      }) ??
                      _getContentWidget();
            }
        )
    )));
  }
  Widget _getContentWidget() {
     return
    // Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: buildAppBar(context),
    //   bottomNavigationBar:
    //   CurvedNavigationBar(items: items,
    //     index: 1,
    //     buttonBackgroundColor: colorManager.primary,
    //     backgroundColor: Colors.transparent,
    //     color: colorManager.primary,
    //     onTap: (int index) {
    //       if(index==1)
    //       {
    //         Navigator.of(context).pushReplacementNamed(Routes.HomeRoute);
    //       }
    //       else
    //       if(index==0)
    //       {
    //         Navigator.of(context).pushReplacementNamed(Routes.employee);
    //       }
    //       }
    //   ),
    //   body:
       StreamBuilder<EmployeeDataModel>(
           stream: _viewModel.outputUserData,
           builder: (context, snapshot) {
             return
          Container(
            child: ListView(
                  physics:  BouncingScrollPhysics(),
                  children: [
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
                                                Flexible(
                                                    flex: 2,

                                                    child:
                          StreamBuilder<EmployeeDataModel>(
                          stream: _viewModel.outputUserData,
                          builder: (context, snapshot) {
                          return

                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(right: 10.0,
                                                          left: 20.0, bottom: 0),
                                                        child: _getEmployeeDataWidget(
                                                          snapshot.data),
                                                    );})

                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                    StreamBuilder<UserImageModel>(
                                                        stream: _imageViewModel.outputUserImage,
                                                        builder: (context, snapshot) {
                                                          return
                                                    SizedBox(width: 20, child:
                                                    _getImageWidget(
                                                        snapshot.data),
                                                    );}
                                                    ))],
                                            ),
                                          ),
                                        ]),
                                    const SizedBox(height: 20),
                                  ]
                              ),
                           // ;

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
                                    buildUpgradeButton(AppStrings.Requests.tr(),colorManager.lightprimary),
                                )
                                )
                               ]),

    ]),
    ),
    ]),

    );});
  }
  Widget buildUpgradeButton(String ReqName,Color bgColor) {
 if(ReqName==AppStrings.Vacation.tr())
  {
    return Hero(
        tag: ReqName,
        transitionOnUserGestures: true,
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.Vacations);
            },
            child: Column(
              children: [
                const SizedBox(width: 70,height: 70,
                  child: Image(image: AssetImage(ImageAssets.Vacation),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(AppStrings.Vacation.tr())
              ],
            )
        )

    );
  }
if(ReqName==AppStrings.Salary.tr())
  { return Hero(
      tag: ReqName,
      transitionOnUserGestures: true,
      child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Routes.salary);
          },
          child: Column(
            children:[
              const SizedBox(width: 70,height: 70,
                child: Image(image: AssetImage(ImageAssets.salary),
                  fit: BoxFit.contain,
                ),
              ),
              Text(AppStrings.Salary.tr())
            ],
          )
      )
  );}

 if(ReqName==AppStrings.Attendance.tr())
  {  return Hero(
      tag: ReqName,
      transitionOnUserGestures: true,
      child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Routes.attendance);
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(width: 70,height: 70,
                child: Image(image: AssetImage(ImageAssets.attendance),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 90,height: 70,child: Text(AppStrings.Attendance.tr()))
            ],
          )
      )
  );}
if(ReqName==AppStrings.Requests.tr())
  {return Hero(
      tag: ReqName,
      transitionOnUserGestures: true,
      child: InkWell(
          onTap: () {
           // Navigator.of(context).pushReplacementNamed(Routes.underConstraction);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UnderConstructionScreen()),
            );
          },
          child: Column(
            children: [
              SizedBox(width: 70,height: 70,
                child: Image(image: AssetImage(ImageAssets.requests),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width:70,height: 70,child: Text(AppStrings.Requests.tr()))
            ],
          )
      )
  );}
return Container();
    // switch (ReqName) {
    //   case "Vacation":
    //     return Hero(
    //           tag: ReqName,
    //           transitionOnUserGestures: true,
    //           child: InkWell(
    //               onTap: () {
    //                 Navigator.of(context).pushReplacementNamed(Routes.Vacations);
    //               },
    //               child: Column(
    //                 children: [
    //                   SizedBox(width: 70,height: 70,
    //                     child: Image(image: AssetImage(ImageAssets.Vacation),
    //                       fit: BoxFit.contain,
    //                     ),
    //                   ),
    //                   Text(AppStrings.Vacation.tr())
    //                 ],
    //               )
    //           )
    //
    //     );
    //   case "Salary":
    //     return Hero(
    //         tag: ReqName,
    //         transitionOnUserGestures: true,
    //         child: InkWell(
    //             onTap: () {
    //               Navigator.of(context).pushReplacementNamed(Routes.salary);
    //             },
    //             child: Column(
    //               children:[
    //                  SizedBox(width: 70,height: 70,
    //                    child: Image(image: AssetImage(ImageAssets.salary),
    //                     fit: BoxFit.contain,
    //                 ),
    //                  ),
    //                 Text(AppStrings.Salary.tr())
    //               ],
    //             )
    //         )
    //     );
    //   case "Attendance":
    //     return Hero(
    //         tag: ReqName,
    //         transitionOnUserGestures: true,
    //         child: InkWell(
    //             onTap: () {
    //
    //             },
    //             child: Column(mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children:[
    //                  SizedBox(width: 70,height: 70,
    //                    child: Image(image: AssetImage(ImageAssets.attendance),
    //                    fit: BoxFit.contain,
    //                 ),
    //                  ),
    //                 SizedBox(width: 80,height: 70,child: Text(AppStrings.Attendance.tr()))
    //               ],
    //             )
    //         )
    //     );
    //   case "Requests":
    //     return Hero(
    //         tag: ReqName,
    //         transitionOnUserGestures: true,
    //         child: InkWell(
    //             onTap: () {
    //             },
    //             child: Column(
    //               children: [
    //                 SizedBox(width: 70,height: 70,
    //                   child: Image(image: AssetImage(ImageAssets.requests),
    //                     fit: BoxFit.contain,
    //                   ),
    //                 ),
    //               SizedBox(width:70,height: 70,child: Text(AppStrings.Requests.tr()))
    //               ],
    //             )
    //         )
    //     );
    //   default:
    //     return Container();
    // }
  }
  Widget buildcountaner(String reqName) {
    return
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
      var empImageData = userData.userDataModel.masterImage;
     String? URLimage= userData.userDataModel.masterImage.toString();
      Constants.imagePath=URLimage;
      Constants.canUpload=empData.masterImage?["CanUploadMasterImage"];
      canEditImage=empData.masterImage?["CanUploadMasterImage"];
      String Name;
      String? language=_appPreferences.getLanguage();
      if(language=="en")
        {
       Name=empData.EnglishName.toString();}
      else
        {
          Name=empData.ArabicName.toString();
        }
      String Email=empData.UserName.toString();
      String Code=empData.EmployeeCode.toString();
     return Column(
          children: [
           Text(Name,
           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
               color: colorManager.white),
    ),
           const SizedBox(height: 3),
          Text(Email,
           style: const TextStyle(color: colorManager.white),
        ),
           const SizedBox(height: 3),
          Text(Code,
            style: const TextStyle(color: colorManager.white),)],
     );}
    else
      {
        return Container();
      }
    }
  Widget _getImageWidget(UserImageModel? userImage) {
    String? URLimage ;
    if (userImage != null) {
       URLimage = userImage.data;

    Constants.imagePath=URLimage;
    //Constants.canUpload!=empData?["CanUploadMasterImage"];
   // bool canEditImage=empData?["CanUploadMasterImage"];
     // String imagePath=" ";
     return ProfileWidget(
          imagePath: URLimage,
          isEdit: false,
          onClicked: () {
            // if(canEditImage == true)
            // {
            //   displayDialoge();
            // }
            // else
            //   {
                resetModules();
                Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
              //}
          }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => editProfileScreen()),
      );
    }
    else {

          URLimage=ImageAssets.noPhoto;
          Constants.imagePath= URLimage;
      return ProfileWidget(
          imagePath: ImageAssets.noPhoto,
          isEdit: false,
          onClicked: () {
            // if(canEditImage == true)
            // {
            //   displayDialoge();
            // }
            // else
            //   {
            resetModules();
            Navigator.of(context).pushReplacementNamed(Routes.editProfileRoute);
            //}
          }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => editProfileScreen()),
      );
    }
  }
  Widget _buildItemList(BuildContext context, int index) {
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
  Widget? displayDialoge() {
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




