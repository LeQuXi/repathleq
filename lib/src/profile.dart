import 'package:flutter/material.dart';

class DebugUiPage extends StatefulWidget {
  DebugUiPage({Key key}) : super(key: key);

  @override
  _DebugUiPageState createState() => new _DebugUiPageState();
}

class _DebugUiPageState extends State<DebugUiPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Profile"),
          backgroundColor: Color.fromARGB(255, 74, 120, 158),
        ),
        body: new Padding(
            padding:
                const EdgeInsets.only(left: 100, right: 0, top: 0, bottom: 400),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")))),
                new Text("Mehmet", textScaleFactor: 1.5)
              ],
            )));
  }
}
