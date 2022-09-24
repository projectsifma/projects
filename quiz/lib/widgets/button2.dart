import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final String buttonText;


  const MyButton2({
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.all(6.0),
            color: Colors.orange,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
