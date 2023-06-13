
import 'package:flutter/material.dart';



//class ReguestList{
  List<String> Rlist =['Vacation Request','Errands Request','Permissions Request','Extra Request','Financial Request','Admin Request'];
//}




class ReguestListWidget extends StatefulWidget {
  const ReguestListWidget({Key? key}) : super(key: key);

  @override
  State<ReguestListWidget> createState() => _ReguestListWidgetState();
}

 Widget buildItemList(BuildContext context,int index)
 {
   if(index== Rlist.length){
     return Center(
       child:CircularProgressIndicator()
     );
   }
     return Container(
       width: 150,
       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
           Container(
             color:Colors.orange,
                 width:150,
                 height:200,
             child:Center(
               child:Text("${Rlist[index]}")
             )

           )
         ]
       )
     );
   }


class _ReguestListWidgetState extends State<ReguestListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

