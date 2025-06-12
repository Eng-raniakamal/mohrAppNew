import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/found_request/found_request_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/header_request_screen_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/no_request/no_request_widget.dart';

class RequestScreenBody extends StatelessWidget {
  const RequestScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text("الطلبات", style:context.text.displayMedium),// AppTextStyle.iBMP24w600
            SizedBox(height: 34.h),
            HeaderRequestScreenWidget(),
            SizedBox(height: 24.h),

            true ? FoundRequestWidget() : NoRequestWidget(),
          ],
        ),
      ),
    );
  }
}
