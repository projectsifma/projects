import 'package:flutter/material.dart';

class ButtonQuiz extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTopped;
  // ignore: use_key_in_widget_constructors
  const ButtonQuiz({
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
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
