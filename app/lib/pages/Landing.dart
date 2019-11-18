import 'dart:async';

import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Image.asset(
          "assets/logo.png",
          scale: 1,
        ),
      ),
    );
  }
}
