import 'package:flutter/material.dart';
//import 'package:quiz/quiz.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  //@override
  //final Color _accentColor = const Color(0xAB4F1476);
  //final Color _purpleColor = Colors.deepPurple;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
          useMaterial3: true,
          //colorSchemeSeed: Color.fromARGB(221, 168, 14, 14),
          scaffoldBackgroundColor: Color(0xAA21325E),
          brightness: Brightness.light),
        
      home: Scaffold(
        //backgroundColor: Colors.deepPurple[100],
        /* appBar: AppBar(
          backgroundColor: const Color.fromARGB(197, 96, 219, 14),
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
                  //gradient: LinearGradient(
                      //begin: FractionalOffset.topCenter,
                      //end: FractionalOffset.bottomCenter,
                      //colors: [_accentColor, _accentColor],
                     // stops: const [0.0, 1.0])
                     ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo2.png',
                      height: 500,
                    ),

                    //const Padding(padding: EdgeInsets.all(0)),
                    SizedBox(
                      //width: double.infinity,
                      width: 325,
                      height: 50,
                      child:
                          //ElevatedButton(
                          MaterialButton(
                        elevation: 5,
                        onPressed: () => Navigator.pushNamed(context, '/Quiz'),

                        color: Color(0xAA17EC0D),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        //style: ElevatedButton.styleFrom(

                        //padding:  EdgeInsets.fromLTRB(80, 10, 80, 10)),
                        child: const Text(
                          'JOGAR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //),
                    )
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
