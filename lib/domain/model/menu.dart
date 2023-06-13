import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "My profile",

      rive: RiveModel(
          src: "assets/RiveAssets/icons.riv",
          artboard: "USER",
          stateMachineName: "USER_Interactivity"),
  ),
  Menu(
    title: "Change Language",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LANGUAGE",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Logout",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LOGOUT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];
