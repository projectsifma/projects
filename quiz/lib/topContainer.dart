import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  const TopContainer(
      {required this.height,
      required this.width,
      required this.child,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4B0082), Color(0xff4B0082)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.9],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
