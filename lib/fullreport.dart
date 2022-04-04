import 'package:flutter/material.dart';

class Full extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<Full> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 222, 226),
        appBar: AppBar(
            title: Text("Full report"),
            titleTextStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24.0,
                fontFamily: '',
                fontWeight: FontWeight.bold),
            backgroundColor: Color.fromARGB(255, 74, 120, 158)));
  }
}
