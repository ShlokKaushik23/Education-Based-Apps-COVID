import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scholarapp/googlesignin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepagelogo(),
    );
  }
}

class homepagelogo extends StatefulWidget {
  @override
  _homepagelogoState createState() => _homepagelogoState();
}

class _homepagelogoState extends State<homepagelogo> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 7),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignDemo(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/3.png',
            height: 400.0,
            fit: BoxFit.fitHeight,
          ),
          SpinKitWave(
            color: Colors.cyanAccent,
          ),
          SizedBox(height: 1.0),
          SpinKitSquareCircle(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
