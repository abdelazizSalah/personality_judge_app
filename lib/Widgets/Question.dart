import 'dart:math';

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String ques;

  // ignore: use_key_in_widget_constructors
  const Question(this.ques);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          ques,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    blurRadius: 80, color: Colors.amber, offset: Offset(10, 10))
              ]),
        ));
  }
}
