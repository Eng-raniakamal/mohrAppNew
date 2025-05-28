import 'package:essmohr/presentation/newDesign/core/utils/app_message.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class HeaderCoreWidget extends StatelessWidget {
  const HeaderCoreWidget({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.iBMP18w400),
          GestureDetector(
            onTap: (){
              AppMessage.msgFunction(context);

            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(subTitle, style: AppTextStyle.iBMP16w700Black),
                SizedBox(height: 10.w),
                Stack(
                  children: [
                    Icon(Icons.keyboard_arrow_up_rounded),
                    Positioned(
                      bottom: -11.h,
                      child: Icon(Icons.keyboard_arrow_down_rounded),
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
