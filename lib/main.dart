import 'package:flutter/material.dart';
import 'Answer.dart';
import 'Question.dart';

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

  List<Map> questionsList = [
    {
      "Question": 'What is your favorite color',
      "Answer": ["Red", "Black", "Green", "Blue", "White"]
    },
    {
      "Question": "What is your favorite pet",
      "Answer": ["Cats", "Dogs", "Birds"]
    },
    {
      "Question": "What is your favorite hobby",
      "Answer": ["Reading", "Writing", "Driving", "Chess"]
    }
  ];
  void TheQuestionSolutions() {
    // this will print it in the console not in the UI but we can the properties of the class
    // in order to be able to use dynamic values
    setState(() {
      questionsCntr = (questionsCntr + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        body: Container(
          child: Column(
            children: [
              Question(questionsList[questionsCntr]["Question"]),
              // i need list of answers dynamicly
              ...(questionsList[questionsCntr]["Answer"] as List<String>)
                  .map((ans) {
                return Answer(ans, TheQuestionSolutions);
              }).toList(),
            ],
          ),
          decoration: BoxDecoration(color: Colors.blueGrey),
        ));
  }
}
