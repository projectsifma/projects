import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int erros = 0;
  int acertos = 0;
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
      "Pergunta": "O que é Flutter?",
      "Respostas": ["Uma linguagem", "Um aplicativo", "Um SDK", "Um notebook"],
      "Alternativas_Corretas": 3,
    });
    for (int i = 3; i <= 20; i++) {
      quiz.add({
        "Pergunta": "Pergunta $i?",
        "Respostas": ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"],
        "Alternativas_Corretas": 1,
      });
    }
    print('Dados Quiz');
    //print(quiz);

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]["Alternativas_Corretas"] ==
            respostaNumero) {
          print('Você acertou!');
          acertos++;
        } else {
          print('Você errou!');
          erros++;
        }

        print('acertos totais: $acertos erros totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o Quiz!');
          Navigator.pushNamed(context, '/Resultados',
              arguments: Argumentos(acertos)); //passando parametro p/ tela
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
          //useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: Text('Pergunta $perguntaNumero de 10',
                      style: const TextStyle(fontSize: 20))),
              Text(
                '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 01');
                    respondeu(1);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][0],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 02');
                    respondeu(2);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(65, 15, 65, 15)),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][1],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 03');
                    respondeu(3);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][2],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Pressionado 04');
                    respondeu(4);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15)),
                  child: Text(
                    quiz[perguntaNumero - 1]['Respostas'][3],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
