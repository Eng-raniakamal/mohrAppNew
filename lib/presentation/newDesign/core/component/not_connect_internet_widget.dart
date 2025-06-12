import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';


class NotConnectInterNetWidget extends StatelessWidget {
  const NotConnectInterNetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: context.color.onPrimary),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: context.color.onPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.height*.20,
            ),
            Icon(Icons.signal_wifi_off, size: 130, color: Colors.orange),
            const SizedBox(height: 20),
            Text(
              "لا يوجد انترنت",
              style: context.text.displayLarge!.copyWith(
                color: context.color.surface,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "يرجى التحقق من اتصالك بالإنترنت",
                textAlign: TextAlign.center,
                style: context.text.headlineLarge!.copyWith(
                  color: context.color.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
