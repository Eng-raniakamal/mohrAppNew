import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Requests/Permissions/Layout/permissionLayout.dart';

import 'package:essmohr/presentation/Requests/Vacations/view/vactions_view.dart';
import 'package:essmohr/presentation/Requests/missionRequest/Layout/missionLayout.dart';

import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import '../resources/routes.dart';
//
// class ImageDropdown extends StatefulWidget {
//   @override
//   ImageDropdownState createState() => ImageDropdownState();
// }
// class ImageDropdownState extends State<ImageDropdown> {
//   String? _selectedOption;
//
//  // Future<Widget>? showDropdownMenu(BuildContext context, Offset position) {
//  //    return showMenu(
//  //      context: context,
//  //      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx, position.dy),
//  //      items: [
//  //        const PopupMenuItem<String>(
//  //          value: 'vacation',
//  //          child: Text('vacation'),
//  //        ),
//  //        const PopupMenuItem<String>(
//  //          value: 'mission',
//  //          child: Text('mission'),
//  //        ),
//  //        const PopupMenuItem<String>(
//  //          value: 'permission',
//  //          child: Text('permission'),
//  //        ),
//  //      ],
//  //    ).then((value) {
//  //      if (value != null) {
//  //        setState(() {
//  //          _selectedOption = value;
//  //        });
//  //
//  //      }
//  //    });
//  //
//  //  }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//           onTapDown: (details) {
//             showDropdownMenu(context, details.globalPosition);
//           },
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Image.asset(
//                 'assets/sample_image.png', // Replace with your image path
//                 width: 100,
//                 height: 100,
//               ),
//               if (_selectedOption != null) ...[
//                 const SizedBox(height: 10),
//                 Text('Selected: $_selectedOption'),
//               ],
//
//             ],
//           ),
//     );
//   }
// }


class CustomImageDropdown extends StatefulWidget {
  @override
  State<CustomImageDropdown> createState() => _CustomImageDropdownState();

  static showCustomDropdown(BuildContext context, Offset globalPosition) {}
}

class _CustomImageDropdownState extends State<CustomImageDropdown> {
  final List<Map<String, dynamic>> screens = [
    {'title': AppStrings.Vacations.tr(), 'screen': vacationsView()},
    {'title': AppStrings.permissions.tr(), 'screen': PermissionLayout(),},
    {'title': AppStrings.missions.tr(), 'screen': MissionLayout(), },
  ];

  void showCustomDropdown(BuildContext context, Offset position) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, position.dx + 50, position.dy + 50),
      items: screens.map((item) {
        return PopupMenuItem<Map<String, dynamic>>(
          value: item,
          child: Row(
            children: [
              // Image.asset(item['image']!, width: 30, height: 30),
              // SizedBox(width: 10),
              Text(item['title']!),
            ],
          ),
        );
      }).toList(),
    ).then((selectedScreen) {
      // if (selectedScreen != null) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => selectedScreen['screen']),
      //   );
      // }
      // Future.microtask(() {
      //   Navigator.pushReplacement(context, MaterialPageRoute(
      //       builder: (context) => selectedScreen?['screen']));
      // });
      if (selectedScreen != null) {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => selectedScreen['screen']),);
         Future.microtask(() {
           switch (selectedScreen['title'].toString()) {
             case 'vacations':
               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectedScreen['screen']));
               Navigator.of(context).pushNamed(Routes.VacationRequest);
             case 'permissions':
               Navigator.of(context).pushNamed(
                   Routes.PermissionRequest);
             case 'Mission':
               Navigator.of(context).pushNamed(Routes.missionRequest);
           }
         });
    }
  });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Dropdown Image for Screens")),
      body: Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) {
            showCustomDropdown(context, details.globalPosition);
          },
            child: Column(
              children: [
              const SizedBox(width: 70,height: 70,
              child: Image(image: AssetImage(ImageAssets.requests),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width:70,height: 70,child: Center(child: Text(AppStrings.Requests.tr())))
        ]),
      ),
    ));
  }
}