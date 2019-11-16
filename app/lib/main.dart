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
          backgroundColor: Color(0x99F1784B),
          title: Text("اعقل"),
        ),
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
      color: Color(0xFFF1784B),
      child: Center(
        child: Image.asset(
          "assets\\logo.png",
          scale: 1,
        ),
      ),
    );
  }
}
