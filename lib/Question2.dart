import 'package:flutter/material.dart';

class Question2 extends StatelessWidget {
  final String question;
  Question2(this.question);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(20),
      child: Center(
          child: Text(
        question,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
