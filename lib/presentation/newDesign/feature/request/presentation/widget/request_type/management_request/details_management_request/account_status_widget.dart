import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/data/model/account_model.dart';

class AccountStatusWidget extends StatelessWidget {
  const AccountStatusWidget({super.key, required this.accountModel});

  final AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    var themeText = Theme.of(context).textTheme;
    var themeColor = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        accountModel.isCertified == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(color: themeColor.onSecondary),
          child: Text("معتمدة", style: themeText.labelMedium),
        )
            : SizedBox(),
        //قيد التدقيق
        accountModel.isUnderReview == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(color: themeColor.secondaryFixed),
          child: Text(
            "قيد التدقيق",
            style: themeText.labelMedium?.copyWith(
              color: themeColor.primaryFixed,
            ),
          ),
        )
            : SizedBox(),
        accountModel.isRejected == true
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
          decoration: BoxDecoration(color: themeColor.onError),
          child: Text(
            "مرفوض",
            style: themeText.labelMedium?.copyWith(color: themeColor.error),
          ),
        )
            : SizedBox(),
      ],
    );
  }
}
