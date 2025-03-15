import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(title: Text('Dice'), backgroundColor: Colors.red),
        body: const DicePageBody(),
      ),
    );
  }
}

class DicePageBody extends StatefulWidget {
  const DicePageBody({super.key});

  @override
  State<DicePageBody> createState() => _DicePageBodyState();
}

class _DicePageBodyState extends State<DicePageBody> {
  int left = 2, right = 1;
  void changeDiceFace(){
    setState(() {
      left = Random().nextInt(6) + 1;
      right = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$left.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$right.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(flex: 2, child: Image(image: AssetImage('images/dice1.png'))),
// Expanded(flex: 2, child: Image(image: AssetImage('images/dice1.png'))),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Image.asset('images/dice1.png'),
//   ),
// ),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Image.asset('images/dice1.png'),
//   ),
// ),
