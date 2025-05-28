import 'package:essmohr/presentation/newDesign/core/utils/app_image.dart';
import 'package:essmohr/presentation/newDesign/core/utils/app_text_style.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputWidget extends StatefulWidget {
  CustomInputWidget({
    super.key,
    required this.emailControl,
    this.hintText,
    this.obscureText = false,
    this.isPassWordInput = false,
    this.validator
  });

  final TextEditingController emailControl;
  final String? hintText;
  bool obscureText;
  bool isPassWordInput;
  String? Function(String?)? validator;
  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      textDirection: TextDirection.rtl,
      validator:widget.validator,
      controller: widget.emailControl,
      keyboardType:
          widget.obscureText == false
              ? TextInputType.emailAddress
              : TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
        fillColor: AppColor.gray,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.conColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary, width: 1),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.iBMP16w500,
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 21.w, left: 8.w),
          child: SvgPicture.asset(
            widget.isPassWordInput == false
                ? AppImage.email
                : AppImage.password,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 24.w,
          maxWidth: 60.w,
          minHeight: 24.h,
          maxHeight: 24.h,
        ),
        suffixIcon:
            widget.isPassWordInput
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      size: 24,
                      color: Color(0xffBEC5D2),
                      widget.obscureText == true
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
