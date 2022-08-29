import 'package:flutter/material.dart';

void main() {
  runApp(PersonalityJudge());
}

class PersonalityJudge extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      home: QuizClass(),
    );
  }
}

class QuizClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

// this is how we connect the state class to the widget i want
// as State is a generic class so we can send to it my customized data type
class HomePage extends State<QuizClass> {
  String _appName = "";
  int questionsCntr = 0;

  List<String> Questions = [
    "What's your favorite color?",
    "What's your favorite animal?"
  ];
  void TheQuestionSolutions() {
    // this will print it in the console not in the UI but we can the properties of the class
    // in order to be able to use dynamic values
    setState(() {
      questionsCntr = (questionsCntr + 1) % 2;
    });
  }

  void answerQuestion1() => _appName += '1';
  void answerQuestion2() => _appName += '2';
  void answerQuestion3() => _appName += '3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Personality Quiz!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 20, // this makes the text shines :D
                  )
                ]),
          ),
        ),
        drawer: Drawer(),
        body: Column(
          children: [
            Text(
              Questions[questionsCntr],
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed:
                  answerQuestion1, // ehna bnb3t esm el function bs msh bn3mlha call, 34an fe ay w2t ndos el onpress hya el btro7 te3ml excute
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: (() => {answerQuestion2()}),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: ((() => answerQuestion3())),
            ),
            RaisedButton(
              child: Text('The Solution'),
              onPressed: ((() => TheQuestionSolutions())),
            ),
          ],
        ));
  }
}
