import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension_theme.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class NotesAdditionalWidget extends StatefulWidget {
  const NotesAdditionalWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  NotesAdditionalWidgetState createState() => NotesAdditionalWidgetState();
}

class NotesAdditionalWidgetState extends State<NotesAdditionalWidget> {
  final int maxLength = 500;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0).r,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color: context.color.outline),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.w,
              child: TextField(
                controller: widget.controller,
                maxLength: maxLength,
                decoration: InputDecoration(
                  hintText: 'أضف ملاحظة',
                  border: InputBorder.none,
                  counterText: '',
                ),
                onChanged: (_) {
                  setState(() {}); // لتحديث العداد
                },
              ),
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
                      color: Color(0xff9EA7B8),
                    ),
                    child: Icon(Icons.notes, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
