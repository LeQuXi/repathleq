import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/blocks/app_block.dart';
import 'package:untitled/src/screens/home_screen.dart';
import 'login.dart';
import 'registration.dart';
import 'fullreport.dart';
import 'src/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginDemo(),
          '/register': (BuildContext context) => new Registration(),
          '/pro': (BuildContext context) => new DebugUiPage()
        },
        home: HomeScreeen(),
      ),
    );
  }
}
