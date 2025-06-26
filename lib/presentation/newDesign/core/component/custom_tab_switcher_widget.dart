
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomTabSwitcherWidget extends StatelessWidget {
  const CustomTabSwitcherWidget({
    super.key,
    required this.listTabs,
    required this.onTabChanged,
    required this.selectedIndex,
  });

  final List<String> listTabs;
  final void Function(int index) onTabChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 5).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColor.lightBlueBg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(listTabs.length, (index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTabChanged(index),
            child: Container(
              height: 32.h,
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primary : null,
                borderRadius: BorderRadius.circular(5).r,
              ),
              child: Center(
                child: Text(
                  listTabs[index],
                  style: context.text.bodySmall!.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
