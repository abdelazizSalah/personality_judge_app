import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  final String Ans;
  final VoidCallback functionHandler;

  Answer2(this.Ans, this.functionHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
          child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        onPressed: functionHandler,
        child: Text(
          Ans,
          style: TextStyle(
            color: Colors.white,
            shadows: [Shadow(blurRadius: 10, color: Colors.white)],
            fontSize: 20,
          ),
        ),
      )),
    );
  }
}
