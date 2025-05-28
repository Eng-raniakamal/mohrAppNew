import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class AppMessage {
 static msgFunction(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("قريبا سيتم اضافة هذه الميزة"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}