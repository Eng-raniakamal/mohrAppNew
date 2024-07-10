//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/presentation/resources/colors.dart';
//import 'dart:math' as Math;

//import 'package:login/ui/widgets/clipper_widget.dart';
Widget defaultButton({
  required Function? function,
  bool isUpperCase = true,
  double radius = 15.0,
  required String text,
  Color background = Colors.blue,
  double width = double.infinity,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: colorManager.white),
        ),
      ),
    );

Widget MyFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  IconData? suffix,
  IconData? prefix,
  required String label,
  Function? suffixPressed,
  Function? onChange,
  Function? onTap,
  Function? onSubmit,
  required Function validate,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: (s) => validate(s),
      // onChanged:(value){onChange!(value);},
      onTap: () {
        onTap!();
      },
      // onFieldSubmitted: (s){
      //   onSubmit!(s);
      // },

      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(prefix),
        // suffixIcon: suffix!= null ? IconButton(
        //   onPressed: suffixPressed!(),
        //   icon:Icon(suffix)):null,

        border: OutlineInputBorder(),
      ),
    );
