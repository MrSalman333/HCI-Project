import 'package:flutter/material.dart';

import 'pages/Landing.dart';
import 'pages/Login.dart';
import 'pages/SignUp.dart';
import 'pages/Data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اعقل',
      theme: ThemeData(
        primaryColor: Color(0xFFf67450),
        accentColor: Color(0xFFA65131),
        primaryColorLight: Color(0xFFF8C2AE),
        backgroundColor: Color(0xFFFBF1F1),
        //primarySwatch: Colors.orange,
        textTheme: ThemeData.light().textTheme.copyWith(
              display2: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              display1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/daydata': (context) => Data(),
      },
    );
  }
}
