import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int num) {
    final player = AudioPlayer();
    player.play(AssetSource('note$num.wav'));
  }
  Expanded buildKey({required int num, required Color color}){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(num);
        },
        child: Text('Click Me'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(num: 1, color: Colors.red),
              buildKey(num:2, color: Colors.orange),
              buildKey(num:3, color: Colors.yellow),
              buildKey(num:4, color: Colors.green),
              buildKey(num:5, color: Colors.teal),
              buildKey(num:6, color: Colors.blue),
              buildKey(num:7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
