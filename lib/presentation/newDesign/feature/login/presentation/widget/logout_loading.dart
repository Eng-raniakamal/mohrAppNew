import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

// class LogoutLoadingDialog extends StatelessWidget {
//   const LogoutLoadingDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const CircularProgressIndicator(),
//             const SizedBox(height: 20),
//             Text(
//               "جاري تسجيل الخروج...",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//               textDirection: TextDirection.rtl,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



class LoadingScreen extends StatelessWidget {
  final String message;

  const LoadingScreen({Key? key, this.message = 'Please wait...'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color:AppColor.primary),
            SizedBox(height: 20),
            Text(
              'Logging out...',
              style: TextStyle(color:AppColor.primary, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}