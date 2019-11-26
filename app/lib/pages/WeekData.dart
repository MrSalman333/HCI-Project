import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/AppUsage.dart';
import '../widgets/WeekChart.dart';

class WeekData extends StatelessWidget {
  List<dynamic> get _randomData {
    var list = List<dynamic>();
    for (var i = 0; i < 7; i++) {
      var randomDriveTime = Random().nextInt(86400);
      list.add({
        'driveTime': randomDriveTime < 1000 ? 0 : randomDriveTime,
        'focusPer': Random().nextDouble()
      });
    }
    return list;
  }

  double get _randomNotFocusPer {
    double totalDrive = 0;
    double totalNotFocus = 0;
    _randomData.forEach((data) {
      totalDrive += data['driveTime'];
      totalNotFocus += data['driveTime'] * data['focusPer'];
    });

    return totalNotFocus / totalDrive;
  }

  List<dynamic> get _apps {
    List<dynamic> value = [];
    for (var i = 0; i < 4; i++) {
      value.add({
        'appName': appNames[i],
        'appTime': Duration(seconds: Random().nextInt(86400)),
        'maxAppTime': Duration(seconds: 86400),
      });
    }
    return value;
  }

  final List<String> appNames = const [
    'whatsapp',
    'snapchat',
    'JucBooks',
    'shore'
  ];

  @override
  Widget build(BuildContext context) {
    double notFocusPer = _randomNotFocusPer;
    double oldnotFocusPer = _randomNotFocusPer;
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          child: Text(
            "معدل عدم التركيز اثناء القيادة",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        DayChart(
          data: _randomData,
        ),
        SizedBox(height: 20),
        Container(
          height: 30,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: Stack(
            children: <Widget>[
              Container(
                color: Color(0xFFe94067),
                width: notFocusPer * 350,
              ),
              Container(
                width: 1,
                color: Colors.black38,
                margin: EdgeInsets.only(left: oldnotFocusPer * 350),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Container(
              margin: EdgeInsets.only(left: (oldnotFocusPer * 350) - 50),
              child: Text('معدل عدم التركيز الاسبوع الماضي')),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 20),
          child: Text(
            'اكثر التطبيقات استعمالا',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ..._apps.map<Widget>((app) => AppUsage(
              appName: app['appName'],
              appTime: app['appTime'],
              maxAppTime: app['maxAppTime'],
            )),
      ],
    );
  }
}
