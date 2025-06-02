import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage('assets/image/request/user.png'), // غير المسار حسب صورتك
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '645533',
              style: theme.titleSmall,
            ),
            Text(
              'محمد فتحى محمد',
              style: theme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}