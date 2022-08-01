import 'package:flutter/material.dart';
import 'myButton.dart';

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
          // colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
          scaffoldBackgroundColor: const Color(0xAA21325E),
          brightness: Brightness.light),
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: const Color.fromARGB(197, 96, 219, 14),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Resultado',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Você acertou\n ${argumentos.acertos} de 10\n perguntas',
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                //const Padding(padding: EdgeInsets.all(0)),
                Center(
                  child: MyButton(
                    buttonTopped: () {
                      print('Pressionado');
                      Navigator.pushNamed(context, '/Quiz');
                      //Navigator.pop(context); //voltar
                    },
                    color: const Color(0xAA17EC0D),
                    buttonText: 'Reiniciar',
                    textColor: Colors.white,
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
