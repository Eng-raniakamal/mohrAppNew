import 'package:flutter/material.dart';

class iconButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color buttonBgColor;

  const iconButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.buttonBgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBgColor,
          shape: StadiumBorder(),
          //onPrimary: Colors.white,
          // backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 17),
        ),
        onPressed: onClicked,
        child: Center(
            child: Column(children: [
          //Image.asset("assets/icons/salary.png"),
          Text(text),
        ])),
      );
}
