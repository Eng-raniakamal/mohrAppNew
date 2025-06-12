import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_message.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class HeaderCoreWidget extends StatelessWidget {
  const HeaderCoreWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.text.displayMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () {
              AppMessage.msgFunction(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  subTitle,
                  style: context.text.displayMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 10.w),
                Stack(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: context.color.onSecondaryFixed,
                    ),
                    // AppColor.black64A,),
                    Positioned(
                      bottom: -11.h,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: context.color.onSecondaryFixed,
                      ), //
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
