import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 100),
              child: Image.asset('assets\\logo.png')),
          Text(
            "تسجيل الدخول",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "الاسم",
                  style: Theme.of(context).textTheme.display2,
                ),
                TextField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  "الرقم السري",
                  style: Theme.of(context).textTheme.display2,
                ),
                TextField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "تسجيل",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      color: Theme.of(context).accentColor,
                    ),
                    FlatButton(
                      child: Text(
                        "تسجيل",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      color: Theme.of(context).accentColor,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
