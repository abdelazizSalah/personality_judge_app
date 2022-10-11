import 'package:flutter/material.dart';

void main() {
  runApp(PersonalityJudge());
}

/**
 * The Material App must exists to call the scafold widget :D
 */
class PersonalityJudge extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return MaterialApp(
      home: PersonalityTest(),
    );
  }
}

class PersonalityTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myApp();
  }
}

class myApp extends State<PersonalityTest> {
  List<String> Questions = [
    "What's your favorite color?",
    "What's your favorite animal?"
  ];
  int questionCounter = 0;
  int res = 0;
  void Ans1PressedKey() => res++;
  void Ans2PressedKey() => res += 2;
  void Ans3PressedKey() => res += 3;
  void SolutionPressedKey() {
    setState(() {
      questionCounter = (questionCounter + 1) % 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personality Quiz!",
          style: TextStyle(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 10,
                ),
              ],
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(),
      body: Column(children: [
        Text(
          Questions[questionCounter],
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        ElevatedButton(child: Text("Answer1"), onPressed: Ans1PressedKey),
        ElevatedButton(child: Text("Answer2"), onPressed: Ans2PressedKey),
        ElevatedButton(child: Text("Answer3"), onPressed: Ans3PressedKey),
        ElevatedButton(
            child: Text("The Solution"), onPressed: SolutionPressedKey),
      ]),
    );
  }
}
