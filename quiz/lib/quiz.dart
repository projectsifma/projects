import 'dart:ffi';

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
    print(quiz);

    int perguntaNumero = 2;

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
              Align(
                  alignment: Alignment.topRight,
                  child: Text('Pergunta $perguntaNumero de 10',
                      style: TextStyle(fontSize: 20))),
              Text(
                'Pergunta:\n\n' + quiz[perguntaNumero - 1]['Pergunta'],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => print('clicou 01'),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][0],
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                ),
              ),
              SizedBox(
                 width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => print('clicou 02'),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][1],
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 15, 100, 15)),
                ),
              ),
              SizedBox(
                 width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => print('clicou 03'),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][2],
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                ),
              ),
              SizedBox(
                 width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => print('clicou 04'),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][3],
                    style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
