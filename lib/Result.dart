import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {
  final int Score;
  final VoidCallback restartQuiz;
  Result(this.Score, this.restartQuiz);

  String get ResString {
    String res = "Your Score is $Score\n";

    if (Score <= 10)
      res += "You're are awesome!";
    else if (Score <= 20)
      res += "Your're pretty likeable";
    else if (Score <= 30)
      res += "You're a little bit wierd";
    else if (Score <= 35)
      res += "You're Strange!";
    else
      res += "You're So bad!";

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.maxFinite,
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Center(
                child: Column(children: [
              Text(
                ResString,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    shadows: [Shadow(blurRadius: 50, color: Colors.amber)]),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: FlatButton(
                  child: Text(
                    'Restart Quiz!',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.amber,
                      fontSize: 23,
                      shadows: [
                        Shadow(
                            blurRadius: 10,
                            color: Colors.amber,
                            offset: Offset(30, 20)),
                      ],
                    ),
                  ),
                  onPressed: restartQuiz,
                ),
              ),
              Container(
                  // margin: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.only(top: 210),
                  child: Center(
                      child: Text(
                    "The more you score the stranger you are !",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        shadows: [Shadow(blurRadius: 50, color: Colors.amber)]),
                  ))),
            ])),
          ),
        ],
      ),
    ));
  }
}
