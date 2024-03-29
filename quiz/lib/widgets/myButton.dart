import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTopped;

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
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
