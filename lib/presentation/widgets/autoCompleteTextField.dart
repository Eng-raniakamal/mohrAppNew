import 'dart:convert';

import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/presentation/Attendance/view/attendanceAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

import 'package:http/http.dart' as http;

class AutoCompleteTextField extends StatefulWidget {
  final String date;
  final int typeId;
  final int type;


  const AutoCompleteTextField({
    Key? key,
    required this.date,
    required this.typeId,
    required this.type,

  }) : super(key: key);

  @override
  _AutoCompleteTextFieldState createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  bool isLoading = false;
  String? userId;
  List<String>? employeeReviewers;

  List<String>? autoCompleteData;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late TextEditingController controller;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final List<String>? stringData = await getAutoReviewers("2024-10-30",0,1);

    //final List<dynamic> json = jsonDecode(stringData);



    setState(() {
      isLoading = false;
      autoCompleteData = stringData!;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return
            Autocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                } else {
                  return autoCompleteData!.where((word) => word
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                }
              },
              optionsViewBuilder:
                  (context, Function(String) onSelected, options) {
                return Material(
                  elevation: 4,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(15,0,15,0),
                    itemBuilder: (context, index) {
                      final option = options.elementAt(index);

                      return ListTile(
                        // title: Text(option.toString()),
                        title: SubstringHighlight(
                          text: option.toString(),
                          term: controller.text,
                          textStyleHighlight: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        // subtitle: Text("This is subtitle"),
                         onTap: () {
                          onSelected(option.toString());
                         },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: options.length,
                  ),
                );
              },
              onSelected: (selectedString) {
                print(selectedString);
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                this.controller = controller;

                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                   // hintText: "Search Something",
                    //prefixIcon: Icon(Icons.search),
                  ),
                );
              },
        //    )
    //       ],
    //     ),
    //   ),
    );
  }
  Future<List<String>?> getAutoReviewers(String? date,int? typeId,int? type) async {
    List<String>? b =[""];
    userId = await _appPreferences.getUserToken();
    String urlPath='${Constants.employeeReviewers}${date!}&requestedTypeId=${typeId!}&requestType=${type!}';
    var response = await http.get(
        Uri.parse(urlPath), headers: <String, String>
    {'Content-Type': 'application/json; charset=UTF-8', 'userId': userId!});
    var responseData;
    // setState(() {
    String jsonsDataString = response.body.toString();
    responseData = json.decode(jsonsDataString);
    // });


    if (responseData != null) {
      final a = (responseData as Iterable).map((data) {
        return EmployeeReviewers?.fromJson(data as Map<String, dynamic>);
      }).toList();


      for (var item in a) {
        b.add(item.name.toString());
      }
    }


    //List<String> b = List<VacationType>.from(a['name'].toList());
    //setState(() {
    employeeReviewers = b;
    //});
    return employeeReviewers;
  }
}

class EmployeeReviewers {
  final int? id;
  final int? employeeId;
  final String? name;
  final String? code;
  final String? picPath;
  final int? order;
  final bool? singleApprovalEnabled;
  final bool? isCurrent;
  // "Id": 19775,
  // "EmployeeId": 19775,
  // "Name": "menna khaled fathy",
  // "Code": "0000",
  // "PicPath": "/Content/Images/employeeIcon.png",
  // "Order": 1,
  // "SingleApprovalEnabled": false,
  //"IsCurrent": true

  EmployeeReviewers(
 {
   required this.id,
   required this.employeeId,
   required this.name,
   required this.code,
   required this.picPath,
   required this.order,
   required this.singleApprovalEnabled,
   required this.isCurrent,
  });

  factory EmployeeReviewers.fromJson(Map<String, dynamic> json) {
    return EmployeeReviewers(
        id: json["Id"],
        employeeId: json["employeeId"],
        name: json["Name"],
        code: json["code"],
        picPath: json["picPath"],
        order: json["Order"],
        singleApprovalEnabled: json["SingleApprovalEnabled"],
        isCurrent: json["IsCurrent"]
    );
  }
}