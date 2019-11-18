import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Image.asset('assets/logo.png'),
              ),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
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
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "الرقم السري",
                      style: Theme.of(context).textTheme.display2,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "دخول",
                            style: const TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/daydata'),
                        ),
                        FlatButton(
                          child: const Text(
                            "تسجيل",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signup'),
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              FlatButton(
                child: const Text(
                  "نسيت الرقم السري؟",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
