import 'package:chineseh/model/HomeIndex.dart';
import 'package:flutter/material.dart';

class HomeArticleItem extends StatefulWidget {
  ListHotArticleListBean article;

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
                  Container(
                    child: new Image.network(
                      widget.article.articleCover,
                      fit: BoxFit.contain,
                    ),
                    width: 226/2,
                    height: 134/2,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        widget.article.articleTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        widget.article.articleDescription,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey,fontSize: 14),
                      )

                    ],
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
