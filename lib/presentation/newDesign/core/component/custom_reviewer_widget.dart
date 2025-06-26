import 'package:essmohr/presentation/newDesign/core/component/custom_decorator_container_widget.dart';
import 'package:essmohr/presentation/newDesign/core/component/custom_status_widget.dart';
import 'package:essmohr/presentation/newDesign/core/model/reviewer_model.dart';
import 'package:essmohr/presentation/newDesign/core/model/status_model.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomReviewerWidget extends StatelessWidget {
  const CustomReviewerWidget({
    super.key, this.nameReviewer, this.statusReviewer, this.idReviewer,
  });
final String?nameReviewer;
final String?statusReviewer;
final  String?idReviewer;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 5).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("المراجع ", style: textTheme.bodyMedium),
                Text(statusReviewer??"موافق ", style: textTheme.bodyMedium),
              ],
            ),
            SizedBox(height: 8.h),
            CustomDecoratorContainerWidget(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  nameReviewer ?? " محمد طارق",
                  style: textTheme.bodyLarge,
                ), // InputDataWidget(
                Text(
                  idReviewer ?? "123456",
                  style: textTheme.bodyLarge,
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}

