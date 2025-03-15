import 'dart:math';

import 'package:flutter/material.dart';

class Magic8Ball extends StatelessWidget {
  const Magic8Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue,
        ),
        body: Magic8BallBody(),
      ),
    );
  }
}

class Magic8BallBody extends StatefulWidget {
  const Magic8BallBody({super.key});

  @override
  State<Magic8BallBody> createState() => _Magic8BallBodyState();
}

class _Magic8BallBodyState extends State<Magic8BallBody> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  i = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset('images/ball$i.png'),
            ),
          ),
        ],
      ),
    );
  }
}
