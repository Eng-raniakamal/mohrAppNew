import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/home/presentation/home_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/screen/person_screen.dart';
import 'package:essmohr/presentation/newDesign/feature/salary/presentation/screen/salary_screen.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Requests/Salary/View/salary_View.dart';
import '../../../../../Requests/Salary/ViewModel/salaryViewModel.dart';
import '../../../../../User/user_view.dart';

class LayoutScreen extends StatefulWidget {
  final int initialIndex;

  const LayoutScreen({super.key, this.initialIndex = 0});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

 // int currentIndex = 0;
  final List<Widget> listScreen = [
    HomeScreen(),
    //userView(),
    Text("الطلبات"),
    Text("الاجازات"),
    salaryView(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: listScreen[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8).r,
            topRight: Radius.circular(8).r,
          ),
          border: Border(top: BorderSide(color: Color(0xffF5F5F5), width: 2.w)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),

          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            elevation: 0,
            selectedItemColor: Color(0xffc9d1d5),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: AppTextStyle.iBMP10w700,
            unselectedLabelStyle: AppTextStyle.iBMP10w700.copyWith(
              color: Colors.black38,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/NewDesign/image/tab/home.svg",
                    color: currentIndex == 0 ? AppColor.primary : null,
                  ),
                ),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/NewDesign/image/tab/document-list.svg",
                    color: currentIndex == 1 ? AppColor.primary : null,
                  ),
                ),
                label: AppStrings.Requests.tr(),
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/NewDesign/image/tab/calendar-plus.svg",
                    color: currentIndex ==2 ? AppColor.primary : null,
                  ),
                ),
                label: "الاجازات",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/NewDesign/image/tab/money-bill.svg",
                    color: currentIndex ==3 ? AppColor.primary : null,
                  ),
                ),
                label: "المرتبات",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/images/NewDesign/image/tab/person.svg",
                    color: currentIndex ==4 ? AppColor.primary : null,
                  ),
                ),
                label: "الملف الشخصى",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
