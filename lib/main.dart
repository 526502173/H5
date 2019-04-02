import 'dart:async';

import 'package:chineseh/NewRoute.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new NewRoute());
}

class StarteApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Sample App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var time=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initFutrun();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      new Image.asset("assets/images/lauch_page.png",fit: BoxFit.cover,);
  }

  void _initFutrun() async {
    Future.delayed(new Duration(seconds: 3), () {
      return "hi world!";
    }).then((data) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return new NewRoute();
      }));
    });
  }
}
