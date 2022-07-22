import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/Quiz': (context) => const Quiz(),
        Resultados.routeName: (context) => const Resultados(),
      },
    );
  }
}
