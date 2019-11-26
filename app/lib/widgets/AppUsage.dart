import 'package:flutter/material.dart';

class AppUsage extends StatelessWidget {
  final String appName;
  final Duration appTime;
  final Duration maxAppTime;

  AppUsage({this.appName, this.appTime, this.maxAppTime});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "${this.appTime.inHours}h${this.appTime.inMinutes - (this.appTime.inHours * 60)}m",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 20,
            width: 250 -
                ((this.appTime.inSeconds / this.maxAppTime.inSeconds) * 250),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(right: 5),
            width: (this.appTime.inSeconds / this.maxAppTime.inSeconds) * 250,
            color: Color(0xFF2196f3),
          ),
          Container(width: 80, child: Text(this.appName)),
        ],
      ),
    );
  }
}
