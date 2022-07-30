import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTopped;
  // ignore: use_key_in_widget_constructors
  const MyButton({
    this.buttonTopped,
    this.color,
    this.textColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTopped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 50,
              width: 325,
              color: color,
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
            )),
      ),
    );
  }
}
