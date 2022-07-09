import 'package:flutter/material.dart';
import 'resultados.dart';
import 'quizDados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final Color _accentColor = const Color(0xFF164CA2);
  int perguntaNumero = 1;
  int erros = 0;
  int acertos = 0;
  @override
  Widget build(BuildContext context) {
    quiz.shuffle(); //Serve para embaralhar as perguntas

    //Função para embaralhar as respostas
    quiz.forEach((elemento) {
      int altCorreta = elemento['Alternativas_Corretas'];
      List respostas = elemento['Respostas'];

      String resCorreta = elemento['Respostas'][altCorreta - 1];

      respostas.shuffle();
      int i = 1;

      respostas.forEach((elemento) {
        print(elemento);
        if (elemento == resCorreta) {
          altCorreta = i;
        }
        i++;
      });
      elemento['Alternativas_Corretas'] = altCorreta;
    });

    /*for (int i = 10; i <= 20; i++) {
      quiz.add({
        "Pergunta": "Pergunta $i?",
        "Respostas": ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"],
        "Alternativas_Corretas": 1,
      });
    }*/
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
          /*colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
          scaffoldBackgroundColor: const Color.fromARGB(255, 211, 240, 237),
          brightness: Brightness.light*/
          ),
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 108, 253, 10),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),*/

        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [_accentColor.withOpacity(0.1), _accentColor],
                      stops: const [0.0, 1.0])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Pergunta $perguntaNumero/10',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    //child: ClipRRect(
                    //borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: double.infinity,
                      color: Color.fromARGB(255, 43, 29, 87),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Text(
                            '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    //),
                  ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {
                                  print('Pressionado 01');
                                  respondeu(1);
                                },
                                color: Colors.orange,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Text(
                                  quiz[perguntaNumero - 1]['Respostas'][0],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {
                                  print('Pressionado 02');
                                  respondeu(2);
                                },
                                color: Colors.orange,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Text(
                                  quiz[perguntaNumero - 1]['Respostas'][1],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {
                                  print('Pressionado 03');
                                  respondeu(3);
                                },
                                color: Colors.orange,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Text(
                                  quiz[perguntaNumero - 1]['Respostas'][2],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: MaterialButton(
                                onPressed: () {
                                  print('Pressionado 04');
                                  respondeu(4);
                                },
                                color: Colors.orange,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Text(
                                  quiz[perguntaNumero - 1]['Respostas'][3],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
