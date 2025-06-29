import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class CustomNotsOfDetailsScreenWidget extends StatelessWidget {
  const CustomNotsOfDetailsScreenWidget({super.key,  this.notText});
  final String?notText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملاحظات اضافية', style: AppTextStyle.iBMP14w500),
        SizedBox(height: 8.h),
        Container(
          height: 79.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
          decoration: BoxDecoration(
            color:AppColor.lightBlueBg,
            //Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Text(notText??'نص الملاحظات'),
        ),
      ],
    );
  }
}
