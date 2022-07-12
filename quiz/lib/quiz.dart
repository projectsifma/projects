import 'package:flutter/material.dart';
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
          useMaterial3: true,
          //colorSchemeSeed: const Color.fromARGB(221, 108, 253, 10),
          scaffoldBackgroundColor: const Color(0xAA21325E),
          brightness: Brightness.light
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
                  /*gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [_accentColor.withOpacity(0.1), _accentColor],
                      stops: const [0.0, 1.0])*/
                      ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
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
                    flex: 7,
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      
                      width: double.infinity,
                      color: const Color(0xAA3E497A),
                      child: Padding(
                       
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          //child: Align(
                          //alignment: Alignment.topCenter,

                          //child: Center(
                          child: Center(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //),
                          //),
                        ),
                      ),
                    ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
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
                                color: Color(0xAA17EC0D),
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
                                color: Color(0xAA17EC0D),
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
                                color: Color(0xAA17EC0D),
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
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {
                                  print('Pressionado 04');
                                  respondeu(4);
                                },
                                color: Color(0xAA17EC0D),
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
                  Expanded(
                    flex: 2,
                    child: Container(),
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
