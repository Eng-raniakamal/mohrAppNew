// import 'package:flutter/material.dart';
//
// class NumbersWidget extends StatelessWidget {
//   const NumbersWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) =>
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           buildButton(context, 'Available', '7 days'),
//           buildDivider(),
//           buildButton(context, 'All', '21 Days'),
//           buildDivider(),
//           buildButton(context, 'Used', '14 Days'),
//         ],
//       );
//
//   Widget buildDivider() =>
//       const SizedBox(
//         height: 24,
//         child: VerticalDivider(),
//       );
//
//   Widget buildButton(BuildContext context, String value, String text) =>
//       MaterialButton(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         onPressed: () {},
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               value,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             const SizedBox(height: 2),
//             Text(
//               text,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//             ),
//           ],
//         ),
//       );
// }