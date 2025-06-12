import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class DayAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const DayAppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: context.text.displayMedium),
      leading: GestureDetector(
        onTap: () {
          // Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets
              .all(12)
              .r,
          color: context.color.secondary, // Color(0xffF2F5F9)
          child: Icon(Icons.close),
        ),
      ),
    );const Placeholder();
  }

  @override
  Size get preferredSize => Size(double.infinity, 55.h);
}
