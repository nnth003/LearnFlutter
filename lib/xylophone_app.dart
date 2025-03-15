import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int num) {
    final player = AudioPlayer();
    player.play(AssetSource('note$num.wav'));
  }
  Expanded buildKey(int num, Color color){
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
              buildKey(1, Colors.red),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    playSound(2);
                  },
                  child: Text('Click Me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {
                    playSound(3);
                  },
                  child: Text('Click Me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    playSound(4);
                  },
                  child: Text('Click Me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: () {
                    playSound(5);
                  },
                  child: Text('Click Me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    playSound(6);
                  },
                  child: Text('Click Me'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    playSound(7);
                  },
                  child: Text('Click Me'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
