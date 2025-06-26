import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/control/layout_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/layout/presentation/widget/custom_container_nav_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex=BlocProvider.of<LayoutCubit>(context).state;
    return   CustomContainerNavWidget(child: BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (value) => context.read<LayoutCubit>().changeIndex(value),
      elevation: 0,
      selectedItemColor:AppColor.primary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyle.iBMP10w700,
      unselectedLabelStyle: AppTextStyle.iBMP10w700.copyWith(
        color: Colors.black38,
      ),
      items: [
        _navItem(
          "assets/images/NewDesign/image/tab/home.svg",
          "الرئيسية",
          currentIndex == 0,
        ),
        _navItem(
          "assets/images/NewDesign/image/tab/document-list.svg",
          "التنبيهات",
          currentIndex == 1,
        ),
        _navItem(
          "assets/images/NewDesign/image/tab/calendar-plus.svg",
          "الاجازات",
          currentIndex == 2,
        ),
        _navItem(
          "assets/images/NewDesign/image/tab/money-bill.svg",
          "المرتبات",
          currentIndex == 3,
        ),
        _navItem(
          "assets/images/NewDesign/image/tab/person.svg",
          "الملف الشخصى",
          currentIndex == 4,
        ),
      ],
    ),);

  }
  BottomNavigationBarItem _navItem(
      String iconPath,
      String label,
      bool isActive,
      ) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 24.h,
        width: 24.w,
        child: SvgPicture.asset(
          iconPath,
          color: isActive ? AppColor.primary : null,
        ),
      ),
      label: label,
    );
  }
}
