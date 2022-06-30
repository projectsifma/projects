import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "Pergunta": "Quem descobriu o Brasil?",
        "Respostas": [
          "Dom Pedro I",
          "Pedro Alvares Cabral",
          "Tiradentes",
          "Dom Predro II"
        ],
        "Alternativas_Corretas": 2,
      }
    ];
    quiz.add({
      "Pergunta": "Flutter é",
      "Respostas": ["Uma linguagem", "Um aplicativo", "Um SDK", "Um notebook"],
      "Alternativas_Corretas": 3,
    });
    print('Dados de lista');
    quiz.forEach((i) {
      print('${quiz.indexOf(i)}- $i');
    });
    print(quiz);

    int perguntaNumero = 1;

    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
          //useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(221, 23, 175, 155),
          scaffoldBackgroundColor: const Color.fromARGB(255, 211, 240, 237),
          brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 23, 175, 155),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Align(
                  alignment: Alignment.topRight,
                  child: Text('Pergunta PerguntaNumero de 10',
                      style: TextStyle(fontSize: 20))),
              const Text(
                'Pergunta:',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => print('clicou 01'),
                child: const Text(
                  'Resposta 01',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
              ),
              ElevatedButton(
                onPressed: () => print('clicou 02'),
                child: const Text(
                  'Resposta 02',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
              ),
              ElevatedButton(
                onPressed: () => print('clicou 03'),
                child: const Text(
                  'Resposta 03',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
              ),
              ElevatedButton(
                onPressed: () => print('clicou 04'),
                child: const Text(
                  'Resposta 04',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
