import 'package:chineseh/HomeArticleItem.dart';
import 'package:chineseh/model/Article.dart';
import 'package:chineseh/model/HomeBannerBean.dart';
import 'package:chineseh/net/ApiManager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // 首页banner列表
  List<DataListBean> banners = List();
  List<Article> articles = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBaner();
    getList(false);
  }

  /// 创建banner条目
  Widget createBannerItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: banners.length != 0
          ? Swiper(
        autoplayDelay: 3500,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: 180,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            banners[index].imagePath,
            fit: BoxFit.fill,
          );
        },
        itemCount: banners.length,
        viewportFraction: 0.8,
        scale: 0.9,
      )
          : SizedBox(
        width: 0,
        height: 0,
      ),
    );
  }


//  请求首页文章页码
  int curPage = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget listView = ListView.builder(
      itemCount: articles.length + 1,
      itemBuilder: (context, index) {
        return index == 0
            ? createBannerItem()
            : HomeArticleItem(articles[index - 1]);
      },
    );

    return new Scaffold(
      body: Container(
        child: listView,
      ),

    );
  }

  void getBaner() async {
    Response response = await ApiManager().getHomeBanner();
    var homeBannerBean = HomeBannerBean.fromJson(response.data);
    setState(() {
      banners.clear();
      banners.addAll(homeBannerBean.data);
    });
  }

  /// 获取首页推荐文章数据
  Future<Null> getList(bool loadMore) async {
    Response response = await ApiManager().getHomeArticle(curPage);
    var homeArticleBean = HomeArticleBean.fromJson(response.data);
    setState(() {
      if(loadMore){
        articles.addAll(homeArticleBean.data.datas);
      } else {
        articles.clear();
        articles.addAll(homeArticleBean.data.datas);
      }

    });
  }
}
