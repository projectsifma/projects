import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz4/models/list.dart';
import '../ui/quiz.dart';

class Countdown extends AnimatedWidget {
   Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    var timerText = '${clockTimer.inMinutes.remainder(60).toString()} : '
        '${(clockTimer.inSeconds.remainder(60) % 60).toString().padLeft(2, '0')}';

    return Text(
      '${timerText}',
      style: TextStyle(fontSize: 40, color: Theme.of(context).primaryColor),
    );
  }
}
