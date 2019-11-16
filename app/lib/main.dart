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
        body: new Landing(),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf67450),
      child: Center(
        child: Image.asset(
          "assets\\logo.png",
          scale: 1,
        ),
      ),
    );
  }
}
