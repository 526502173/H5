import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserPageState();
  }
}

class UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title:"这不是一个号召同样",
      home: new Scaffold(
        body: Center(
          child: new Text("这很好，这是一个用户页面"),
        )
      ),
    );
  }
}
