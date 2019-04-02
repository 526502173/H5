import 'package:chineseh/ChatPage.dart';
import 'package:chineseh/HomePage.dart';
import 'package:chineseh/UserPage.dart';
import 'package:flutter/material.dart';


class NewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NewRouteState();
  }
}

class NewRouteState extends State<NewRoute> {
  var _pageCtr;
  int _tabIndex=0;
  @override
  void initState() {
    super.initState();
    _pageCtr=PageController(initialPage: 0,keepPage: true);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageCtr.dispose();
    super.dispose();
  }
  _tap(int index) {
    setState(() {
      _tabIndex = index;
      _pageCtr.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(
        body: PageView(
          controller: _pageCtr,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            ChatPage(),
            UserPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.deepPurpleAccent,
            onTap: (index) => _tap(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), title: Text("在线问诊")),
              BottomNavigationBarItem(icon: Icon(Icons.contact_mail), title: Text("我的"))
            ]),
      ),
    );
  }
}
