import 'package:flutter/material.dart';

import './pages/Landing.dart';
import './pages/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اعقل',
      theme: ThemeData(
        primaryColor: Color(0xFFf67450),
        accentColor: Color(0xFFA65131),
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: new Login(),
      ),
    );
  }
}
