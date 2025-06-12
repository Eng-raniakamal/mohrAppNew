import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/day/control/day_tab_switcher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayTabSwitchWidget extends StatelessWidget {
  const DayTabSwitchWidget({super.key, required this.tabs});

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18).r,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: context.color.secondary, // Color(0xFFF2F5F9),
        ),
        child: BlocBuilder<DayTabSwitcherCubit, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (index) {
                bool isSelected = index == state;
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<DayTabSwitcherCubit>(
                      context,
                    ).changeTab(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColor.primary : null,
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style:context.text.bodySmall!.copyWith(
                          color:
                              isSelected
                                  ? context.color.surface
                                  : context.color.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
