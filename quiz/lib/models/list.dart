import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz4/widgets/myButton.dart';
import 'quizDados.dart';

int perguntaNumero = 1;
List test = [
  quiz[perguntaNumero - 1]['Respostas'][0],
  quiz[perguntaNumero - 1]['Respostas'][1],
  quiz[perguntaNumero - 1]['Respostas'][2],
  quiz[perguntaNumero - 1]['Respostas'][3],
];

class Alist extends StatefulWidget {
  const Alist({Key? key}) : super(key: key);
  @override
  State<Alist> createState() => _AlistState();
}
class _AlistState extends State<Alist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: test.length,
      itemBuilder: (BuildContext context, int index) {
        return MyButton(
          buttonText: test[index],
        );
      },
    );
  }
}
