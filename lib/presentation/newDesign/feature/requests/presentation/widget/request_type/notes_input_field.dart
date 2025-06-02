//import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class NotesInputField extends StatefulWidget {
  const NotesInputField({super.key, required this.controller});
  final TextEditingController controller ;

  @override
  NotesInputFieldState createState() => NotesInputFieldState();
}

class NotesInputFieldState extends State<NotesInputField> {
  final int maxLength = 500;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملاحظات اضافية',
          style:context.text.bodyMedium ,
        ),
        SizedBox(height: 8.h),

        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              border: Border.all(color: context.color.outline,)
          ),
          child: Column(
            children: [
              TextField(
                controller: widget.controller,
                maxLines: null,
                maxLength: maxLength,
                decoration:  InputDecoration(
                  hintText: 'نص الملاحظات',
                  border: InputBorder.none,
                  counterText: '',
                  // isDense: true,

                ),
                onChanged: (_) {
                  setState(() {}); // لتحديث العداد
                },



              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${widget.controller.text.length}/$maxLength',
                      style: const TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5).r,
                          color:  Color(0xff9EA7B8),
                        ),
                        child: Icon(Icons.notes,color:Colors.white))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}