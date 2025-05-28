import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/tab_person_screen_cubit/tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_data_widget.dart';

class NextPageDataWidget extends StatelessWidget {
  NextPageDataWidget({super.key});

  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerSubCity = TextEditingController();
  TextEditingController controllerAreaCity = TextEditingController();
  TextEditingController controllerAddressCity = TextEditingController();
  TextEditingController numberAddressControl = TextEditingController();
  TextEditingController numberBoxControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("العنوان", style: AppTextStyle.iBMP16w700Black),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: InputDataWidget(
                title: "المدينة",
                hint: "مثال: مدينة نصر",
                controller: controllerCity,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: InputDataWidget(
                title: "المنطقة",
                hint: "مثال: مدينة نصر",
                controller: controllerSubCity,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "الحي",
          hint: "مثال : حي العقاد",
          controller: controllerAreaCity,
        ),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "العنوان",
          hint: "مثال : القاهرة ، مدينة نصر ، شارع عباس العقاد",
          controller: controllerAddressCity,
        ),
        SizedBox(height: 16.h),
        Text("البريد", style: AppTextStyle.iBMP16w700Black),

        InputDataWidget(
          title: "الرقم البريدي",
          hint: "0000",
          controller: numberAddressControl,
        ),
        SizedBox(height: 16.h),

        InputDataWidget(
          title: "رقم صندوق البريد",
          hint: "0000",
          controller: numberBoxControl,
        ),

        SizedBox(height: 16.h),

        ElevatedButton(
          onPressed: () {
            BlocProvider.of<TabCubit>(context).changeTab(1);

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
                "حفظ التعديلات",
                style: AppTextStyle.iBMP14w700.copyWith(color: Colors.white),
              ),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),

      ],
    );
  }
}
