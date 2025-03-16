import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'qizz_brain.dart';

QuizzBrain quizzBrain = QuizzBrain();

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPageBody(),
          ),
        ),
      ),
    );
  }
}

class QuizPageBody extends StatefulWidget {
  const QuizPageBody({super.key});

  @override
  State<QuizPageBody> createState() => _QuizPageBodyState();
}

class _QuizPageBodyState extends State<QuizPageBody> {
  List<Icon> score = [];

  void checkAnswer(bool picked) {
    bool answerC = quizzBrain.getCorrectAnswer();
    setState(() {
      if (quizzBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
              },
              width: 120,
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ).show();
        quizzBrain.reset();
        score = [];
      } else {
        if (picked == answerC) {
          score.add(Icon(Icons.check, color: Colors.green));
        } else {
          score.add(Icon(Icons.close, color: Colors.red));
        }
      }

      quizzBrain.nextQuestion();
    });
  }

  // List<String> question = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answer = [false, true, true];
  // Question q1 = Question(
  //   questionText: 'You can lead a cow down stairs but not up stairs.',
  //   questionAnswer: false,
  // );

  // void addScore(bool check) {
  //   setState(() {
  //     if (check) {
  //       score.add(const Icon(Icons.check, color: Colors.green));
  //     } else {
  //       score.add(const Icon(Icons.close, color: Colors.red));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                // addScore(true);
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                // addScore(false);

                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(children: score),
      ],
    );
  }
}
