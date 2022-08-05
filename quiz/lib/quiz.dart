import 'package:flutter/material.dart';
import 'buttonQuiz.dart';
import 'resultados.dart';
import 'quizDados.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // final Color _accentColor = const Color(0xFF164CA2);
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

    Size size = MediaQuery.of(context).size;
    return
        //MaterialApp(
        //title: 'Quiz',
        //theme: ThemeData(
        //useMaterial3: true,
        //colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
        //scaffoldBackgroundColor: const Color(0xAA21325E),
        //brightness: Brightness.light),
        //home:
        Scaffold(
      /*appBar: AppBar(
          backgroundColor: const Color.fromARGB(221, 108, 253, 10),
          title: const Center(
            child: Text(
              'Quiz Português',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),*/

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(18.0),
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
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
                height: 140,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Pergunta $perguntaNumero/10',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 237, 231, 246),
                            fontWeight: FontWeight.w500))),
              ),
              //),

              Positioned(
                bottom: 300,
                left: 0,
                right: 0,
                //child: Padding(
                //padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    width: size.width,
                    height: 175,
                    color: const Color(0xAA3E497A),
                    //child: Padding(

                    //child: Container(
                    //child: Align(
                    //alignment: Alignment.topCenter,

                    //child: Center(
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //),
                    //),
                    //),
                    //),
                    //),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                //flex: 10,
                //child: Padding(
                //padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: 320,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: ButtonQuiz(
                          buttonTopped: () {
                            print('Pressionado 01');
                            respondeu(1);
                          },
                          color: Colors.deepPurple,
                          buttonText: quiz[perguntaNumero - 1]['Respostas'][0],
                          textColor: Colors.white,
                        ),
                      ),
                      Center(
                        child: ButtonQuiz(
                          buttonTopped: () {
                            print('Pressionado 02');
                            respondeu(2);
                          },
                          color: Colors.deepPurple,
                          buttonText: quiz[perguntaNumero - 1]['Respostas'][1],
                          textColor: Colors.white,
                        ),
                      ),
                      Center(
                        child: ButtonQuiz(
                          buttonTopped: () {
                            print('Pressionado 03');
                            respondeu(3);
                          },
                          color: Colors.deepPurple,
                          buttonText: quiz[perguntaNumero - 1]['Respostas'][2],
                          textColor: Colors.white,
                        ),
                      ),
                      Center(
                        child: ButtonQuiz(
                          buttonTopped: () {
                            print('Pressionado 04');
                            respondeu(4);
                          },
                          color: Colors.deepPurple,
                          buttonText: quiz[perguntaNumero - 1]['Respostas'][3],
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                //),
              ),
              //Expanded(
              //flex: 3,
              //child: Container(),
              //),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
