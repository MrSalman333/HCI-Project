import 'dart:core';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
/*   final _barWidth = 28.0;
  final _barMargin = .6965;
  final _barMaxHeight = 284.0;
 */
  final _barWidth = 60.0;
  final _barMargin = 14.0;
  final _barMaxHeight = 284.0;

  List<Widget> get _randomBars {
    var list = <Widget>[];
    for (var i = 0; i < 4; i++) {
      var randomS = Random().nextInt(21600);
      if (randomS < 2000) randomS = 0;
      list.add(Bar(
        barMargin: _barMargin,
        barMaxHeight: _barMaxHeight,
        barWidth: _barWidth,
        driveTime: Duration(seconds: randomS),
        maxDriveTime: Duration(seconds: 21600),
        unfucusPer: Random().nextDouble(),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text("معدل عدم التركيز اثناء القيادة"),
        Container(
          width: double.infinity,
          height: 359,
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: Size.fromHeight(300),
                painter: ChartPainter(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("12AM"),
                      SizedBox(width: 55),
                      Text("6AM"),
                      SizedBox(width: 55),
                      Text("12PM"),
                      SizedBox(width: 55),
                      Text("6PM"),
                    ],
                  ),
                  Container(
                    height: _barMaxHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: _randomBars,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    final points = [
      Offset(0, 0),
      Offset(0, size.height),
      Offset(size.width / 4, size.height),
      Offset(size.width / 4, 0),
      Offset(size.width / 4, size.height),
      Offset(size.width / 2, size.height),
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      Offset(size.width * 3 / 4, size.height),
      Offset(size.width * 3 / 4, 0),
      Offset(size.width * 3 / 4, size.height),
      Offset(size.width, size.height),
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
  final barMargin;
  var barMaxHeight;
  final Duration driveTime;
  final unfucusPer;
  final Duration maxDriveTime;
  Bar(
      {this.barMargin,
      this.barMaxHeight,
      this.barWidth,
      this.driveTime,
      this.unfucusPer,
      this.maxDriveTime}) {
    this.barMaxHeight -= 20;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 20,
          child: Text(
            "${driveTime.inHours}h${driveTime.inMinutes - (driveTime.inHours * 60)}m",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: barMargin),
          color: Colors.deepPurple.withBlue(255),
          height: (driveTime.inSeconds *
                  (1 - unfucusPer) /
                  maxDriveTime.inSeconds) *
              barMaxHeight,
          width: barWidth,
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: barMargin),
          color: Colors.red,
          height: (driveTime.inSeconds * unfucusPer / maxDriveTime.inSeconds) *
              barMaxHeight,
          width: barWidth,
          alignment: Alignment.center,
          child: Text(
            "${(unfucusPer * 100).round()}%",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
