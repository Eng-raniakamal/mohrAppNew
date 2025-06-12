import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomContainerNavWidget extends StatelessWidget {
  const CustomContainerNavWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: const Color(0xffF5F5F5), width: 2.w),
          ),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child:child
        )
    );
  }
}
