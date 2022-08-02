import 'package:flutter/material.dart';
import 'myButton.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAA21325E),
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        //decoration: BoxDecoration(
        //gradient: LinearGradient(
        //begin: FractionalOffset.topCenter,
        //end: FractionalOffset.bottomCenter,
        //colors: [_accentColor, _accentColor],
        // stops: const [0.0, 1.0])
        //),
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: 385,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      //color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                      height: 500,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 135,
                left: 0,
                right: 0,
                child: Center(
                  child: MyButton(
                      buttonText: 'Iniciar',
                      //color: Colors.deepPurple,
                      color: const Color(0xAA17EC0D),
                      textColor: Colors.white,
                      buttonTopped: () =>
                          Navigator.pushNamed(context, '/Quiz')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
