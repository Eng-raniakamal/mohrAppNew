import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MultiDayTimePicker extends StatefulWidget {
  const MultiDayTimePicker({super.key});

  @override
  _MultiDayTimePickerState createState() => _MultiDayTimePickerState();
}

class _MultiDayTimePickerState extends State<MultiDayTimePicker> {
  DateTime? startDate;
  DateTime? endDate;
  Map<String, Map<String, TimeOfDay>> dayTimes = {};

  Future<void> pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDateRange: startDate != null && endDate != null
          ? DateTimeRange(start: startDate!, end: endDate!)
          : null,
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
        initializeDayTimes();
      });

      showTimeDialogForEachDay();
    }
  }

  void initializeDayTimes() {
    dayTimes.clear();
    if (startDate != null && endDate != null) {
      final daysCount = endDate!.difference(startDate!).inDays + 1;
      for (int i = 0; i < daysCount; i++) {
        final date = startDate!.add(Duration(days: i));
        final key = DateFormat('yyyy-MM-dd').format(date);
        dayTimes[key] = {"from": TimeOfDay(hour: 9, minute: 0), "to": TimeOfDay(hour: 17, minute: 0)};
      }
    }
  }

  void showTimeDialogForEachDay() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("اختر الوقت لكل يوم"),
        content: Container(
          width: double.maxFinite,
          height: 400,
          child: ListView(
            children: dayTimes.keys.map((date) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text("من: "),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: dayTimes[date]!["from"]!,
                          );
                          if (picked != null) {
                            setState(() {
                              dayTimes[date]!["from"] = picked;
                            });
                          }
                        },
                        child: Text(dayTimes[date]!["from"]!.format(context)),
                      ),
                      SizedBox(width: 10),
                      Text("إلى: "),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: dayTimes[date]!["to"]!,
                          );
                          if (picked != null) {
                            setState(() {
                              dayTimes[date]!["to"] = picked;
                            });
                          }
                        },
                        child: Text(dayTimes[date]!["to"]!.format(context)),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("إلغاء")),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("تم"),
          )
        ],
      ),
    );
  }

  String getSummary() {
    if (startDate == null || endDate == null) return "لم يتم اختيار النطاق";
    final buffer = StringBuffer();
    dayTimes.forEach((date, times) {
      buffer.writeln("$date: من ${times["from"]!.format(context)} إلى ${times["to"]!.format(context)}");
    });
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختيار المدة والساعات")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickDateRange,
              child: Text("اختر من/إلى (تاريخ + ساعات)"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(getSummary(), style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}