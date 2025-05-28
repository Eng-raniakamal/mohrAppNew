import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';

class InputDataWidget extends StatelessWidget {
  const InputDataWidget({super.key, required this.title, required this.hint, required this.controller});

  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style:AppTextStyle.iBMP14w500),
        SizedBox(height: 8.h,),
        TextField(
          controller: controller,
          style: AppTextStyle.iBMP16w500Black,
          decoration: InputDecoration(
            
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE6E6E6)),
              borderRadius: BorderRadius.circular(12).r,),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14).r,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
