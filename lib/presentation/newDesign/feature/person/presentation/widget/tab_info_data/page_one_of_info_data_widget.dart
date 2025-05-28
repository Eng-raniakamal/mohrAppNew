import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign//feature/person/control/page_cubit/page_cubit.dart';


import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_info_data/custom_image_pick_widget.dart';
import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_info_data/input_birth_day_widget.dart';
import 'package:essmohr/presentation/newDesign//feature/person/presentation/widget/tab_info_data/input_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOneOfInfoDataWidget extends StatelessWidget {
   PageOneOfInfoDataWidget({super.key});
  TextEditingController arabicNameController=TextEditingController();
  TextEditingController engNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController telephoneController=TextEditingController();
  TextEditingController idController=TextEditingController();
  TextEditingController nIdController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImagePickWidget(),
        SizedBox(height: 21.h),
        Center(
          child: Text(
            "اخر عملية تسجيل دخول | اليوم 21:31 AM",
            style: AppTextStyle.iBMP14w500,
          ),
        ),
        SizedBox(height: 16.h),
        Text("بياناتي", style: AppTextStyle.iBMP16w700Black),
        SizedBox(height: 16.h),
        InputDataWidget(title: "الاسم باللغة العربية", hint: "الاسم بالكامل",controller: arabicNameController,),
        SizedBox(height: 16.h),
        InputDataWidget(title: "الاسم باللغة الانجليزية", hint: "Full Name",controller: engNameController,),
        SizedBox(height: 16.h),

        InputBirthDayWidget(data: '',),

        InputBirthDayWidget(data: "تاريخ الميلاد",),

        SizedBox(height: 16.h),
        InputDataWidget(title: "البريد الالكتروني", hint: "example@gmail.com",controller: emailController,),
        SizedBox(height: 16.h),
        InputDataWidget(title: "رقم الهاتف", hint: "+966 0000000",controller: telephoneController,),
        SizedBox(height: 16.h),
        InputDataWidget(title: "الرقم القومي", hint: "000 0 000",controller: idController,),
        SizedBox(height: 16.h),
        InputDataWidget(title: "الرقم الاجتماعي", hint: "000 0 000",controller: nIdController,),
        SizedBox(height: 16.h),

        ElevatedButton(
          onPressed: () {
            BlocProvider.of<PageCubit>(context).changePage(1);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "التالي",
                style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),

        // CustomElevatedButtonWidget(
        //   icon: Icons.arrow_forward,
        //   data:  "التالي",
        //   onPressed:  () {
        //     BlocProvider.of<PageCubit>(context).changePage(1);
        //   },
        //
         ),
      ],
    );
  }
}

