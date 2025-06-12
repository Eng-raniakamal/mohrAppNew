import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class VacationInputDateDayWidget extends StatefulWidget {
  const VacationInputDateDayWidget({super.key, required this.title, this.fillColor, required this.onDateSelected, });
  final String title;
  final Color? fillColor;
  final void Function(DateTime) onDateSelected;
  @override
  State<VacationInputDateDayWidget> createState() => _VacationInputDateDayWidgetState();
}

class _VacationInputDateDayWidgetState extends State<VacationInputDateDayWidget> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,  style:textTheme.bodyMedium),
        SizedBox(height: 8.h,),
        GestureDetector(
          onTap: _showDatePickerDialog,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(color: colorTheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child:   Row(
              children: [
                Text(
                  _formatFullDate(selectedDate),
                  style: textTheme.titleMedium,
                ),
                const Spacer(),
                Icon(Icons.calendar_today_outlined, size: 20),
              ],
            ),
          ),

        ),
      ],
    );
  }



  String _formatFullDate(DateTime date) {
    // تنسيق التاريخ كامل بالعربية، مثلاً: الإثنين، 1 يونيو 2025
    return DateFormat('EEEE، d MMMM yyyy', 'ar').format(date);
  }

  void _showDatePickerDialog() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2075),
      locale: const Locale('ar'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // لون رأس التاريخ
              onPrimary: Colors.white, // لون نص الرأس
              onSurface: Colors.black, // لون نص الأيام
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, // لون أزرار النص
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
  }



// Future<void> _pickDate() async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2025),
  //     lastDate: DateTime(2200),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //     widget.onDateSelected(picked);
  //   }
  // }
  //
  // String _monthName(int month) {
  //   const months = [
  //     "January",
  //     "February",
  //     "March",
  //     "April",
  //     "May",
  //     "June",
  //     "July",
  //     "August",
  //     "September",
  //     "October",
  //     "November",
  //     "December",
  //   ];
  //   return months[month - 1];
  // }
}


