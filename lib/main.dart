import 'package:flutter/material.dart';
import 'package:start/BMI/bmi.dart';
import 'package:start/Coin/coin.dart';
import 'package:start/Statement/task.dart';
import 'package:start/Story/stories.dart';
import 'package:start/dice_page.dart';
import 'package:start/magic_8_ball.dart';
import 'package:start/Quizzler/quizzler.dart';
import 'package:start/xylophone_app.dart';

import 'mi_cart.dart';
// cd android
// .\gradlew clean build
void main() {
  // runApp(const IamRich());
  // runApp(const MiCart());
  // runApp(const DicePage());
  // runApp(const Magic8Ball());
  // runApp(const XylophoneApp());
  // runApp(const Quizzler());
  // runApp(const Stories());
  // runApp(const BMI());
  // runApp(const Coin());
  runApp(TaskApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Hello Hello"),
//         ),
//         body: const Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 35,
//               backgroundImage: NetworkImage(
//                 'https://avatars.githubusercontent.com/u/33576285?v=4',
//               ),
//             ),
//             Padding(padding: EdgeInsets.all(2.0)),
//             Column(
//               children: <Widget>[
//                 Text(
//                   'Thanh Hai',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Learning Flutter',
//                   style: TextStyle(
//                     fontSize: 15,
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
