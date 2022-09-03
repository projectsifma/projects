import 'package:flutter/material.dart';
import 'ui/homePage.dart';
import 'ui/quiz.dart';
import 'ui/resultados.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      debugShowCheckedModeBanner: false,
    );
  }
}
