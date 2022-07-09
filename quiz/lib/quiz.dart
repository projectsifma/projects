import 'package:flutter/material.dart';
import 'resultados.dart';

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
      "Respostas": [
        "Uma linguagem de programção",
        "Um aplicativo",
        "Um SDK",
        "Um notebook"
      ],
      "Alternativas_Corretas": 3,
    });
    quiz.add({
      "Pergunta": "O Brasil faz parte de qual bloco econômico?",
      "Respostas": ["Mercosul", "CEI", "NAFTA", "União Europeia"],
      "Alternativas_Corretas": 1,
    });
    quiz.add({
      "Pergunta": "Normalmente, quantos litros de sangue uma pessoa tem?",
      "Respostas": [
        "Tem entre 2 a 4 litros",
        "Tem entre 4 a 6 litros",
        "Tem 10 litros",
        "Tem 7 litros"
      ],
      "Alternativas_Corretas": 2,
    });
    quiz.add({
      "Pergunta": "De quem é a famosa frase “Penso, logo existo”?",
      "Respostas": ["Platão", "Galileu Galilei", "Descartes", "Sócrates"],
      "Alternativas_Corretas": 3,
    });
    quiz.add({
      "Pergunta": "Quais o menor e o maior país do mundo?",
      "Respostas": [
        "Vaticano e Rússia",
        "Nauru e China",
        "Mônaco e Canadá",
        "São Marino e Índia"
      ],
      "Alternativas_Corretas": 1,
    });
    quiz.add({
      "Pergunta": "Quantas casas decimais tem o número pi?",
      "Respostas": ["Milhares", "Vinte", "Centenas", "Infinitas"],
      "Alternativas_Corretas": 4,
    });
    quiz.add({
      "Pergunta": "Quanto tempo a luz do Sol demora para chegar à Terra?",
      "Respostas": ["12 minutos", "1 dia", "8 minutos", "segundos"],
      "Alternativas_Corretas": 3,
    });
    quiz.add({
      "Pergunta": "Em que período da pré-história o fogo foi descoberto?",
      "Respostas": [
        "Paleolítico",
        "Idade dos Metais",
        "Neolítico",
        "Período da Pedra Polida"
      ],
      "Alternativas_Corretas": 1,
    });
    quiz.add({
      "Pergunta": "Em qual local da Ásia o português é língua oficial?",
      "Respostas": ["Índia", "Macau", "Filipinas", "Moçambique"],
      "Alternativas_Corretas": 2,
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          //decoration: const BoxDecoration(
                          //color: Color.fromARGB(207, 14, 144, 219)),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Pergunta $perguntaNumero/10',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        '\n\n${quiz[perguntaNumero - 1]['Pergunta']}',
                        style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          print('Pressionado 01');
                          respondeu(1);
                        },
                        color: Colors.orange,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
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
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          print('Pressionado 02');
                          respondeu(2);
                        },
                        color: Colors.orange,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
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
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          print('Pressionado 03');
                          respondeu(3);
                        },
                        color: Colors.orange,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
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
          ],
        ),
      ),
    );
  }
}
