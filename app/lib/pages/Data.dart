import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chart.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: CupertinoSegmentedControl(
                borderColor: Colors.black,
                pressedColor: Theme.of(context).primaryColor.withAlpha(100),
                selectedColor: Theme.of(context).primaryColor,
                children: {"day": Text("اليوم"), "week": Text("اخر 7 ايام")},
                groupValue: _selected,
                onValueChanged: (value) => setState(() => _selected = value)),
          ),
          _selected == "day" ? Chart() : Text("week")
        ],
      ),
    );
  }
}
