import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';

class InputBirthDayWidget extends StatefulWidget {



  const InputBirthDayWidget({super.key, required this.data, });
  final String data;



  @override
  State<InputBirthDayWidget> createState() => _InputBirthDayWidgetState();
}

class _InputBirthDayWidgetState extends State<InputBirthDayWidget> {
  DateTime selectedDate = DateTime(2024, 3, 22);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("تاريخ الميلاد",  style:AppTextStyle.iBMP14w500),

        Text(widget.data,  style:AppTextStyle.iBMP14w500),

        SizedBox(height: 8.h,),
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedDate.day} ${_monthName(selectedDate.month)} ${selectedDate.year}",style:
                AppTextStyle.iBMP16w500Black
                  ,
                ),
                Icon(Icons.calendar_today_outlined),



                Icon(Icons.calendar_today_outlined),
                SizedBox(width: 8.w,),
                Text(
                  " ${selectedDate.year}",
                  style:
                  AppTextStyle.iBMP16w500Black
                  ,
                ),
                Text(
                  " ${_monthName(selectedDate.month)} ",
                  style:
                AppTextStyle.iBMP16w500Black
                  ,
                ),
                Text(
                  "${selectedDate.day}  ",
                  style:
                  AppTextStyle.iBMP16w500Black
                  ,
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
