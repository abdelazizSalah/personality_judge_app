import 'package:flutter/material.dart';
import './Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final Map question;
  final Function functionHandler;
  const Quiz({
    required this.question,
    required this.functionHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Question(question['Question']),
        ...(question['Answer'] as List<Map>).map((Ans) {
          return Answer(Ans["Key"], () => functionHandler(Ans['Score']));
        }).toList(),
      ]),
    );
  }
}
