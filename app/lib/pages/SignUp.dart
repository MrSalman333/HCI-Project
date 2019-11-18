import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFFFBF1F1),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 50,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Text(
              "التسجيل",
              style: TextStyle(fontSize: 45),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    "الاسم",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "الرقم السري",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "تاكيد الرقم السري",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "البريد الإلكتروني",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.centerLeft,
                    child: RaisedButton(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: Text(
                          "تسجيل",
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/daydata'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
