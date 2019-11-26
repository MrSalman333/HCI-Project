import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/chart.dart';

class DayData extends StatelessWidget {
  List<dynamic> get _randomData {
    var list = List<dynamic>();
    for (var i = 0; i < 8; i++) {
      var randomDriveTime = Random().nextInt(10800);
      list.add({
        'driveTime': randomDriveTime < 1000 ? 0 : randomDriveTime,
        'focusPer': Random().nextDouble()
      });
    }
    return list;
  }

  double get _notFocusPer {
    double totalDrive = 0;
    double totalNotFocus = 0;
    _randomData.forEach((data) {
      totalDrive += data['driveTime'];
      totalNotFocus += data['driveTime'] * data['focusPer'];
    });

    return totalNotFocus / totalDrive;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          Chart(
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
                  width: _notFocusPer * 350,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
