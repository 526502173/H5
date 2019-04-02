import 'package:chineseh/model/Article.dart';
import 'package:flutter/material.dart';

class HomeArticleItem extends StatefulWidget {
  Article article;

  HomeArticleItem(this.article);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeArticleState();
  }
}

class _HomeArticleState extends State<HomeArticleItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Card(
        margin: EdgeInsets.all(2),
        child: Container(
          child: Column(
            children: <Widget>[
             Row(
               children: <Widget>[
                 Icon(
                   Icons.child_care,
                   color: Colors.blueAccent,
                   size: 18,
                 ),
                 Text(
                   widget.article.author,
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(color: Colors.blueAccent),
                 )
               ],

             ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.article.title.replaceAll("&rdquo;", "").replaceAll("&ldquo;", ""),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16),
              ),

            ),
             Row(
               children: <Widget>[
                 Icon(
                   Icons.access_time,
                   color: Colors.grey,
                   size: 15,
                 ),
                 Expanded(
                     flex: 1,
                     child: Padding(
                       padding: EdgeInsets.only(left: 8),
                       child: Text(
                         widget.article.niceDate,
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(color: Colors.grey),
                       ),
                     ))
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}
