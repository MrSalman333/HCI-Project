import 'dart:core';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DayChart extends StatelessWidget {
/*   final _barWidth = 28.0;
  final _barMargin = .6965;
  final _barMaxHeight = 284.0;
 */
/*   final _barWidth = 60.0;
  final _barMargin = 14.0;
  final _barMaxHeight = 284.0; */

  final _barWidth = 30.0;
  final _barMaxHeight = 280.0;
  final List<dynamic> data;
  List<Widget> get _bars {
    var list = <Widget>[];
    for (var i = 0; i < data.length; i++) {
      var driveTime = this.data[i]['driveTime'];
      var focusPer = this.data[i]['focusPer'];
      list.add(Bar(
        barMaxHeight: _barMaxHeight,
        barWidth: _barWidth,
        driveTime: Duration(seconds: driveTime),
        maxDriveTime: Duration(seconds: 86400),
        unfucusPer: focusPer,
      ));
    }
    return list;
  }

  DayChart({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.white),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 329,
            padding:
                const EdgeInsets.only(bottom: 5, top: 20, right: 10, left: 10),
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size.fromHeight(300),
                  painter: ChartPainter(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("الاحد"),
                        Text("الاثنين"),
                        Text("الثلاثاء"),
                        Text("الاربعاء"),
                        Text("الخميس"),
                        Text("الجمعة"),
                        Text("السبت"),
                      ],
                    ),
                    Container(
                      height: _barMaxHeight,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: _bars,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          KeyInfo(
            color: Color(0xFF2196f3),
            info: 'مدة القيادة',
          ),
          KeyInfo(
            color: Color(0xFFe94067),
            info: 'نسبة عدم التركيز',
          )
        ],
      ),
    );
  }
}

class KeyInfo extends StatelessWidget {
  final color;
  final info;
  KeyInfo({this.color, this.info});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(this.info),
          Container(
            height: 15,
            width: 15,
            color: this.color,
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double widthOfOne = size.width / 7;
    double height = size.height + 4;
    final pointMode = ui.PointMode.polygon;
    final points = [
      Offset(0, 0),
      Offset(0, height),
      Offset(widthOfOne, height),
      Offset(widthOfOne, 0),
      Offset(widthOfOne, height),
      Offset(2 * widthOfOne, height),
      Offset(2 * widthOfOne, 0),
      Offset(2 * widthOfOne, height),
      Offset(3 * widthOfOne, height),
      Offset(3 * widthOfOne, 0),
      Offset(3 * widthOfOne, height),
      Offset(4 * widthOfOne, height),
      Offset(4 * widthOfOne, 0),
      Offset(4 * widthOfOne, height),
      Offset(5 * widthOfOne, height),
      Offset(5 * widthOfOne, 0),
      Offset(5 * widthOfOne, height),
      Offset(6 * widthOfOne, height),
      Offset(6 * widthOfOne, 0),
      Offset(6 * widthOfOne, height),
      Offset(7 * widthOfOne, height),
      Offset(7 * widthOfOne, 0),
      Offset(7 * widthOfOne, height),
    ];
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class Bar extends StatelessWidget {
  final barWidth;
  final barMaxHeight;
  final Duration driveTime;
  final unfucusPer;
  final Duration maxDriveTime;
  Bar(
      {this.barMaxHeight,
      this.barWidth,
      this.driveTime,
      this.unfucusPer,
      this.maxDriveTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 20,
          width: barWidth,
          child: Text(
            "${driveTime.inHours}h${driveTime.inMinutes - (driveTime.inHours * 60)}m",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Color(0xFF2196f3),
          height: (driveTime.inSeconds *
                  (1 - unfucusPer) /
                  maxDriveTime.inSeconds) *
              (barMaxHeight - 20),
          width: barWidth,
          alignment: Alignment.center,
        ),
        Container(
          color: Color(0xFFe94067),
          height: (driveTime.inSeconds * unfucusPer / maxDriveTime.inSeconds) *
              (barMaxHeight - 20),
          width: barWidth,
          alignment: Alignment.center,
          child: Text(
            "${(unfucusPer * 100).round()}%",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
