import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Color.fromARGB(221, 108, 253, 10),
          scaffoldBackgroundColor: const Color.fromARGB(255, 211, 240, 237),
          brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 108, 253, 10),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo2.png',
                height: 500,
              ),
              //const Padding(padding: EdgeInsets.all(0)),
              ElevatedButton(
                onPressed: () => print('clicou'),
                child: const Text(
                  'JOGAR',
                  style: TextStyle(fontSize: 40),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 13, 100, 13)),
              )
            ],
          ),
        ),
      ),
    );
  }
}




