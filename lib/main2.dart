import "package:flutter/material.dart";
import './Widgets/Answer.dart';
import './Widgets/Result.dart';
import 'Widgets/Quiz.dart';

void main() {
  runApp(PersonalityJudge());
}

class PersonalityJudge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
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
  bool start = false;
  int questionCntr = 0;
  int totalScore = 0;
  //2- we need to create the list of the questions
  List<Map<String, Object>> Questions = [
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
      start = false;
    });
  }

  void StartTheQuiz() {
    setState(() {
      start = true;
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
        body: start == false
            ? Container(
                height: 700,
                child: Center(
                    child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(top: 250),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Let's Get Started?",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  blurRadius: 50,
                                  color: Colors.amber,
                                  offset: Offset(20, 10))
                            ]),
                      )),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent)),
                      onPressed: StartTheQuiz,
                      child: Text(
                        "Start",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(blurRadius: 50, color: Colors.white)
                            ]),
                      ),
                    ),
                  )
                ])))
            : questionCntr < Questions.length
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Quiz(
                        question: Questions[questionCntr],
                        functionHandler: evaluater))
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Center(child: Result(totalScore, restartQuiz)),
                  ));
  }
}
