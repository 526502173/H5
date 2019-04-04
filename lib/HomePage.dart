import 'package:chineseh/HomeArticleItem.dart';
import 'package:chineseh/model/Article.dart';
import 'package:chineseh/model/HomeIndex.dart';
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
  List<BannerListBean> banners = List();
  List<ListHotArticleListBean> articles = List();
  List<ListOfficeListBean> offices = List();
  HospitalBean hos = new HospitalBean(img: "",url: "");
  int curPage = 0;

  //ScrollController _scrollController=new ScrollController();
  @override
  void initState() {
    super.initState();
    getIndex();
    /* _scrollController.addListener((){
      var maxScrollExtent = _scrollController.position.maxScrollExtent;
      var pixels = _scrollController.position.pixels;
      if(maxScrollExtent==pixels){
        curPage++;
        getList(true);
      }
    });*/
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
                  banners[index].img,
                  fit: BoxFit.fill,
                );
              },
              itemCount: banners.length,
              scale: 0.9,
            )
          : SizedBox(
              width: 0,
              height: 0,
            ),
    );
  }

  Widget createHos() {
    return Container(
      child: Column(
        children: <Widget>[
          Text("泰斗中医院",style: TextStyle(fontSize: 18,color:const Color(0xF010101) ),),
          Image.network(
            hos.img,
            height: 150,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  Widget createOfficeItem() {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Image.network(
                  offices[0].officeImg,
                  width: 26,
                  height: 26,
                ),
                Text(
                  offices[0].name,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Image.network(
                  offices[1].officeImg,
                  width: 26,
                  height: 26,
                ),
                Text(
                  offices[0].name,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Image.network(
                  offices[2].officeImg,
                  width: 26,
                  height: 26,
                ),
                Text(
                  offices[0].name,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Image.network(
                  offices[3].officeImg,
                  width: 26,
                  height: 26,
                ),
                Text(
                  offices[0].name,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.builder(
      itemCount: articles.length + 1,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return createBannerItem();
          case 1:
            return createOfficeItem();
          case 2:
            return createHos();
        }
        return HomeArticleItem(articles[index - 2]);
      },
    );

    return new Scaffold(
      body: Container(child: listView),
    );
  }

/*  new Image.network(
  widget.article.articleCover,
  fit: BoxFit.contain,
  ),
  width: 226/2,
  height: 134/2,
  ),*/

  /*Future<Null> _pullToRefresh() async{
    curPage=0;
    await getList(false);
    return null;
  }*/

  void getIndex() async {
    Response response = await ApiManager().getHomeIndex();
    var homeBannerBean = HomeIndex.fromJson(response.data);
    setState(() {
      if (homeBannerBean != null) {
        print("homeBannerBean:" + homeBannerBean.code.toString());
        banners.clear();
        banners.addAll(homeBannerBean.data.banner);
        articles.clear();
        articles.addAll(homeBannerBean.data.listHotArticle);
        offices.clear();
        offices.addAll(homeBannerBean.data.listOffice);
        hos = homeBannerBean.data.hospital;
      } else {
        print(homeBannerBean.toString());
      }
    });
  }

  /// 获取首页推荐文章数据
/* Future<Null> getList(bool loadMore) async {
    Response response = await ApiManager().getHomeArticle(curPage);
    var homeArticleBean = HomeArticleBean.fromJson(response.data);
    setState(() {
      if(loadMore){
        //articles.addAll(homeArticleBean.data.datas);
      } else {

      }

    });
  }*/
}
