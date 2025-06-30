import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class InputDataWidget extends StatelessWidget {
  const InputDataWidget({
    super.key,
    this.title,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,

  });

  final String? title;
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: context.text.bodyMedium),
          if (title != null) SizedBox(height: 8.h),
        TextField(
          controller: controller,
          style: context.text.titleMedium,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: fillColor == null ? false : true,
            hintText: hint,
    hintStyle: TextStyle(
    color: Colors.grey.shade400,),
            border:
                title != null
                    ? OutlineInputBorder(
                      borderSide: BorderSide(color: context.color.outline),
                      borderRadius: BorderRadius.circular(12).r,
                    )
                    : InputBorder.none,

            focusedBorder:
                title != null
                    ? OutlineInputBorder(
                      borderSide: BorderSide(color: context.color.outline),
                      borderRadius: BorderRadius.circular(12).r,
                    )
                    : InputBorder.none,
            enabledBorder:
                title != null
                    ? OutlineInputBorder(
                      borderSide: BorderSide(color: context.color.outline),
                      borderRadius: BorderRadius.circular(12).r,
                    )
                    : InputBorder.none,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding:    EdgeInsets.symmetric(horizontal: 12, vertical: 14).r,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
