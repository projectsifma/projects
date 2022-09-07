import 'package:flutter/material.dart';

class ButtonQuiz extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;

  final buttonTopped;
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: 53,
          width: MediaQuery.of(context).size.width,
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
