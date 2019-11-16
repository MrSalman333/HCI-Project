import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'اقل',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("اعقل"),
        ),
        body: Center(
          child: Image.asset(
            "assets\\logo.png",
            scale: 1,
          ),
        ),
      ),
    );
  }
}
