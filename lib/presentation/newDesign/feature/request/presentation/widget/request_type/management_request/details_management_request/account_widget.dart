import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/request/data/model/account_model.dart';
import 'package:essmohr/presentation/newDesign/feature/request/presentation/widget/request_type/management_request/details_management_request/account_status_widget.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key, required this.accountModel});

  final AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
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
                Text(
                  "المراجع ${accountModel.title} " ?? "المراجع ",
                  style: textTheme.bodyMedium,
                ),

                AccountStatusWidget(accountModel: accountModel),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
              decoration: BoxDecoration(
                border: Border.all(color: colorTheme.outline),
                borderRadius: BorderRadius.circular(8).r,
                color: colorTheme.onPrimaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    accountModel.name ?? " محمد طارق",
                    style: textTheme.bodyLarge,
                  ), // InputDataWidget(
                  Text(
                    accountModel.value ?? "123456",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
