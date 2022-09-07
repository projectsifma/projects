import 'package:flutter/cupertino.dart';

class Constants {
  final Gradient gradienBackground = const LinearGradient(
    colors: [Color(0xff302b63), Color(0xff0f0c29)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
  final Gradient gradienTemporizador = const LinearGradient(
    colors: [Color(0xAA17EC0D), Color(0xAA17EC0D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.9],
    tileMode: TileMode.clamp,
  );
}
