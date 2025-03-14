import 'package:flutter/material.dart';

class MiCart extends StatelessWidget {
  const MiCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(title: Text("My Cart"), backgroundColor: Colors.white),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/diamond.png'),
              ),
              Text(
                'Nguyen Thanh Hai',
                style: TextStyle(
                  fontFamily: 'Pacific',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSans3-Regular',
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.5
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal
                  ),
                  title: Text(
                    '123456789',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSans3-Regular',
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                      Icons.email,
                      color: Colors.teal
                  ),
                  title: Text(
                    'abc@gmail.com',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSans3-Regular',
                        fontSize: 20.0
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
// Container(
// padding: EdgeInsets.all(10.0),
// color: Colors.white,
// margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
// child: Row(
// children: <Widget>[
// Icon(
// Icons.phone,
// color: Colors.teal,
// ),
// SizedBox(
// width: 10.0,
// ),
// Text(
// '123456789',
// style: TextStyle(
// color: Colors.teal.shade900,
// fontFamily: 'SourceSans3-Regular',
// fontSize: 20.0
// ),
// )
// ],
// ),
// ),