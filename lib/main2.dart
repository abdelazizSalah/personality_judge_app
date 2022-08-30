import "package:flutter/material.dart";
import 'Quiz.dart';
import 'Result.dart';

void main() {
  runApp(PersonalityJudge());
}

class PersonalityJudge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //backend logic
  //1- we need to create the counter of the items
  int questionCntr = 0;
  int totalScore = 0;
  //2- we need to create the list of the questions
  List<Map> Questions = [
    {
      "Question": "What is your favorite color?",
      "Answer": [
        {"Key": "Red", "Score": 7},
        {"Key": "Black", "Score": 10},
        {"Key": "White", "Score": 1},
        {"Key": "Green", "Score": 5}
      ]
    },
    {
      "Question": "What is your favorite animanl?",
      "Answer": [
        {"Key": "Lion", "Score": 7},
        {"Key": "Bear", "Score": 10},
        {"Key": "Cat", "Score": 1},
        {"Key": "Dog", "Score": 5}
      ]
    },
    {
      "Question": "Which of these words describes you the best?",
      "Answer": [
        {"Key": "Arogant", "Score": 10},
        {"Key": "Extrovert", "Score": 1},
        {"Key": "Crazy", "Score": 5},
        {"Key": "Introvert", "Score": 3},
        {"Key": "Lazy", "Score": 7}
      ]
    },
    {
      "Question": "What is your favorite type of movies?",
      "Answer": [
        {"Key": "Tragedy", "Score": 7},
        {"Key": "Horror", "Score": 10},
        {"Key": "Science-fiction", "Score": 5},
        {"Key": "Comedy", "Score": 1},
        {"Key": "Action", "Score": 3},
      ]
    },
  ];

  //3- the function which contains the set state and the score modifiers

  void evaluater(int score) {
    totalScore += score;
    setState(() {
      questionCntr++;
    });
  }

  void restartQuiz() {
    setState(() {
      totalScore = 0;
      questionCntr = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // here we can create our logic
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Personality Quiz!",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 10, color: Colors.white)],
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        body: questionCntr < Questions.length
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Quiz(Questions[questionCntr], evaluater))
            : Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Result(totalScore, restartQuiz)),
              ));
  }
}
