import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title:"这不是一个号召同样",
      home: new Scaffold(
        body: Center(
          child: new Text("这很好，这是一个会话页面"),
        )
      ),
    );
  }
}
