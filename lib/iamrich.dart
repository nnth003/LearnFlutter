import 'package:flutter/material.dart';

class IamRich extends StatelessWidget{
  const IamRich({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              title: Text("I Am Rich"),
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Image(image: AssetImage('images/diamond.png')),
            )
        )
    );
  }
}