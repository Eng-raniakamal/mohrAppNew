// import 'package:flutter/material.dart';
// import 'package:essmohr/presentation/resources/colors.dart';
//
// class CustomBarWidget extends StatelessWidget {
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
//   CustomBarWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SizedBox(
//         height: 160.0,
//         child: Stack(
//           children: <Widget>[
//             Container(
//               color: colorManager.primary,
//               width: MediaQuery.of(context).size.width,
//               height: 100.0,
//               child: const Center(
//                 child: Text(
//                   "Home",
//                   style: TextStyle(color: colorManager.white, fontSize: 18.0),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 80.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(1.0),
//                       border: Border.all(
//                           color: colorManager.greywithOpacity, width: 1.0),
//                       color: colorManager.white),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(
//                           Icons.menu,
//                           color: colorManager.primary,
//                         ),
//                         onPressed: () {
//                           //print("your menu action here");
//                             _scaffoldKey.currentState!.openDrawer();
//                         },
//                       ),
//                       const Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Search",
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.search,
//                           color: colorManager.primary,
//                         ),
//                         onPressed: () {
//                           //print("your menu action here");
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.notifications,
//                           color: colorManager.primary,
//                         ),
//                         onPressed: () {
//                           //print("your menu action here");
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
