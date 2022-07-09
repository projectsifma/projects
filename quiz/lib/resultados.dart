import 'package:flutter/material.dart';

class Argumentos {
  int acertos = 0;
  Argumentos(this.acertos);
}

class Resultados extends StatelessWidget {
  static const routeName = '/Resultados';
  //final int acertos;

  const Resultados({/*required this.acertos,*/ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)?.settings.arguments as Argumentos;
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
                Text('Você acertou\n ${argumentos.acertos} de 10\n perguntas',
                    style: const TextStyle(fontSize: 25)),
                //const Padding(padding: EdgeInsets.all(0)),
                SizedBox(
                  width: 325,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      print('Pressionado');
                      Navigator.pushNamed(context, '/Quiz');
                      //Navigator.pop(context); //voltar
                    },
                    color: Colors.orange,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: const Text(
                      'Jogar Novamente',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
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
