import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class InputDateDayWidget extends StatefulWidget {
  const InputDateDayWidget({super.key, required this.data, this.fillColor, });
  final String data;
 final Color? fillColor;

  @override
  State<InputDateDayWidget> createState() => _InputDateDayWidgetState();
}

class _InputDateDayWidgetState extends State<InputDateDayWidget> {
  DateTime selectedDate = DateTime(2024, 3, 22);

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.data,  style:textTheme.bodyMedium),
        SizedBox(height: 8.h,),
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(color: colorTheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [

                Icon(Icons.calendar_today_outlined,size: 20.r,),
                SizedBox(width: 8.w,),
                Text(
                  " ${selectedDate.year}",
                  style:
                  textTheme.titleMedium                  ,
                ),
                Text(
                  " ${_monthName(selectedDate.month)} ",
                  style:
                  textTheme.titleMedium                  ,
                ),
                Text(
                  "${selectedDate.day}  ",
                  style:
                  textTheme.titleMedium                  ,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}
