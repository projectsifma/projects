import 'package:flutter/material.dart';
import 'package:quiz4/widgets/topContainer.dart';
import '../widgets/button2.dart';
import '../widgets/buttonQuiz.dart';
import 'resultados.dart';
import '../models/quizDados.dart';

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
    quiz.shuffle(); //Serve para embaralhar as perguntas
    //Função para embaralhar as respostas
    quiz.forEach((elemento) {
      int altCorreta = elemento['Alternativas_Corretas'];
      List respostas = elemento['Respostas'];
      String resCorreta = elemento['Respostas'][altCorreta - 1];
      respostas.shuffle();
      int i = 1;
      respostas.forEach((elemento) {
        //print(elemento);
        if (elemento == resCorreta) {
          altCorreta = i;
        }
        i++;
      });
      elemento['Alternativas_Corretas'] = altCorreta;
    });
    print('Dados Quiz');
    //print(quiz);
    void respondeu(int respostaNumero) {
      setState(
        () {
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
        },
      );
    }

    List test = [
      quiz[perguntaNumero - 1]['Respostas'][0],
      quiz[perguntaNumero - 1]['Respostas'][1],
      quiz[perguntaNumero - 1]['Respostas'][2],
      quiz[perguntaNumero - 1]['Respostas'][3],
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff302b63), Color(0xff0f0c29)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: [
              TopContainer(
                height: 130,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        /*Pergunta $perguntaNumero/10*/ 'Será implementado Temporizador',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
              ),

              const SizedBox(height: 23.0),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: size.width,
                        height: 180,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const MyButton2(buttonText: 'Perguntas:'),
                                  MyButton2(
                                      buttonText: ' $perguntaNumero / 10'),
                                ],
                              ),
                              Center(
                                child: Text(
                                  '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                                  style: const TextStyle(
                                      color: Color(0xff302b63),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: size.width,
                      height: 275,
                      //padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: ButtonQuiz(
                              buttonTopped: () {
                                print('Pressionado 1');
                                respondeu(1);
                              },
                              color: Colors.orange,
                              buttonText: quiz[perguntaNumero - 1]['Respostas']
                                  [0],
                              textColor: Colors.white,
                            ),
                          ),
                          Center(
                            child: ButtonQuiz(
                              buttonTopped: () {
                                print('Pressionado 02');
                                respondeu(2);
                              },
                              color: Colors.orange,
                              buttonText: quiz[perguntaNumero - 1]['Respostas']
                                  [1],
                              textColor: Colors.white,
                            ),
                          ),
                          Center(
                            child: ButtonQuiz(
                              buttonTopped: () {
                                print('Pressionado 03');
                                respondeu(3);
                              },
                              color: Colors.orange,
                              buttonText: quiz[perguntaNumero - 1]['Respostas']
                                  [2],
                              textColor: Colors.white,
                            ),
                          ),
                          Center(
                            child: ButtonQuiz(
                              buttonTopped: () {
                                print('Pressionado 04');
                                respondeu(4);
                              },
                              color: Colors.orange,
                              buttonText: quiz[perguntaNumero - 1]['Respostas']
                                  [3],
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///),
                  ]),
                ),
              ),
              //),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
