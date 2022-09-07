import 'package:flutter/material.dart';
import 'package:quiz4/models/constantes.dart';
import '../widgets/myButton.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Constants myConstants = Constants();
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: myConstants.gradienBackground,
          ),
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  bottom: 350,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[50],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(170, 6, 8, 19),
                              offset: Offset(5.0, 5.0),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 60, 52, 82),
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/logo_quiz.png',
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: MyButton(
                      buttonText: 'Iniciar',
                      color: const Color(0xAA17EC0D),
                      textColor: Colors.white,
                      buttonTopped: () =>
                          Navigator.pushNamed(context, '/Quiz')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
