
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';

int selectBtn = 1;
AnimatedContainer navigationBar() {
  return AnimatedContainer(
    height: 70.0,
    duration: const Duration(milliseconds: 400),
    decoration: BoxDecoration(
      color: colorManager.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
        topRight:
        Radius.circular(selectBtn == navBtn.length - 1 ? 0.0 : 20.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < navBtn.length; i++)
          GestureDetector(
            onTap: () => (selectBtn = i),
            child: iconBtn(i),
          ),
      ],
    ),
  );
}

SizedBox iconBtn(int i) {
  bool isActive = selectBtn == i ? true : false;
  var height = isActive ? 60.0 : 0.0;
  var width = isActive ? 50.0 : 0.0;
  return SizedBox(
    width: 75.0,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            height: height,
            width: width,
            duration: const Duration(milliseconds: 600),
            child: isActive
                ? CustomPaint(
             // painter: ButtonNotch(),
            )
                : const SizedBox(),
          ),
        ),
        Align(
          alignment: Alignment.center,


          ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            navBtn[i].name,
            style: isActive ? bntText.copyWith(color: colorManager.selectColor) : bntText,
          ),
        )
      ],
    ),
  );
}
const TextStyle bntText = TextStyle(
  color: colorManager.selectColor,
  fontWeight: FontWeight.w500,
);
class Model {
  final int id;
  final icon = Icons.account_box;
  final String name;

  Model({
    required this.id,
    //required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0,  name: 'menu'),
  Model(id: 1,  name: 'Search'),

  Model(id: 2, name: 'notification'),
  Model(id: 3,  name: 'Profile'),
];