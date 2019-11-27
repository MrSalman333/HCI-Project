import 'package:app/pages/DayData.dart';
import 'package:app/pages/WeekData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  String _selected = "day";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Color(0xFFFBF1F1),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: CupertinoSegmentedControl(
                    borderColor: Colors.black,
                    pressedColor: Theme.of(context).primaryColor.withAlpha(100),
                    selectedColor: Theme.of(context).primaryColor,
                    children: {
                      "day": Text("اليوم"),
                      "week": Text("اخر 7 ايام")
                    },
                    groupValue: _selected,
                    onValueChanged: (value) =>
                        setState(() => _selected = value)),
              ),
              _selected == "day" ? DayData() : WeekData()
            ],
          ),
        ),
      ),
    );
  }
}
