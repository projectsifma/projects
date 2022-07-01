import 'package:flutter/material.dart';

class Resultados extends StatelessWidget {
  final int acertos;

  const Resultados({required this.acertos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
          scaffoldBackgroundColor: const Color.fromARGB(255, 211, 240, 237),
          brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(197, 96, 219, 14),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Resultado', style: TextStyle(fontSize: 25)),
                Text('Você acertou\n $acertos de 10\n perguntas',
                    style: TextStyle(fontSize: 25)),
                //const Padding(padding: EdgeInsets.all(0)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => print('clicou'),
                    child: const Text(
                      'JOGAR NOVAMENTE',
                      style: TextStyle(fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
