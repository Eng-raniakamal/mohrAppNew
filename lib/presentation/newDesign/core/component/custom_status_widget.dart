import 'package:essmohr/presentation/newDesign/core/model/status_model.dart';

import '../../feature/layout/export_layout_file.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key, required this.statusModel,
  });

  final StatusModel statusModel;
  @override
  Widget build(BuildContext context) {
    // var themeText = Theme.of(context).textTheme;
    // var themeColor = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        statusModel.  isCertified == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: context.color.onSecondary,
          ),
          child: Text("معتمدة", style: context.text.labelMedium),
        )
            : SizedBox(),
        //قيد التدقيق
        statusModel. isUnderReview == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: context.color.secondaryFixed,
          ),
          child: Text("قيد التدقيق",
            style: context.text.labelMedium?.copyWith(
                color: context.color.primaryFixed
            ),
          ),
        )
            : SizedBox(),
        statusModel. isRejected == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(
            color: context.color.onError,
          ),
          child: Text("مرفوض",
            style: context.text.labelMedium?.copyWith(
                color: context.color.error
            ),
          ),
        )
            : SizedBox(),
        SizedBox(width: 3.w),
      ],
    );
  }
}
