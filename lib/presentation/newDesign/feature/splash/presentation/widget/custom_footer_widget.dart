import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomFooterWidget extends StatelessWidget {
  const CustomFooterWidget({super.key, required this.list, required this.currentPage});
  final List list;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 16.h,
      width: 66.w,
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(5).r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          list.length,
              (i) => Container(
            margin:
            const EdgeInsets.symmetric(horizontal: 4).r,
            // width: i == currentPage ? 20 : 8,
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color:
              i == currentPage
                  ? AppColor.primary
                  : AppColor.steelGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}