import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class AppBarManagementRequestWidget extends StatelessWidget {
  const AppBarManagementRequestWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon
  });

  final String title;
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:onTap,
          child: Container(
            padding: EdgeInsets.all(8).r,
            //color: Theme.of(context).colorScheme.secondary,
            child: Icon(icon??Icons.close),
          ),
        ),
        SizedBox(width: 12.w),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}