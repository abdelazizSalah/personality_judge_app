import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String Ans;
  final VoidCallback functionHandler;
  Color c1 = Colors.white;

  Answer(this.Ans, this.functionHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: functionHandler,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
          child: Text(
            Ans,
            style: TextStyle(
                color: c1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 5, color: Colors.white)]),
          )),
    );
  }
}
