import 'package:flutter/material.dart';
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