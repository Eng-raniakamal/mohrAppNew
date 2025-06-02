import 'package:essmohr/presentation/newDesign/core/configure/route/app_route.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/onboarding/data/page_model.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_footer_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/splash/presentation/widget/custom_page_widget.dart';



class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({super.key});

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  List<PageModel> pages = PageModel.pages;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: EdgeInsets.all(16.0).r,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: 100.h),
                          CustomPageWidget(pageModel: page),
                          SizedBox(height: 32.h),
                          if (index == 0)
                            CustomButtonWidget(onTap: nextPage, title: "التالي")
                          else if (index == pages.length - 1)
                            CustomButtonWidget(
                              onTap: startNow,
                              title: "ابدأ الآن",
                            )
                          else
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .55,
                                  child: CustomButtonWidget(
                                    onTap: nextPage,
                                    title: "التالى",
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .35,
                                  child: CustomButtonWidget(
                                    color: AppColor.lightBlueBg,
                                    colorTitle: AppColor.primary,
                                    onTap: nextPage,
                                    title: "تخطي",
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                          CustomFooterWidget(list:pages,currentPage:currentPage),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.linear,
      );
    }
  }

  void skip() {
    _pageController.jumpToPage(pages.length - 1);
  }

  void startNow() {
    // انتقل إلى شاشة تسجيل الدخول أو الرئيسية
    Navigator.pushReplacementNamed(context, AppRoute.login);
  }
}




