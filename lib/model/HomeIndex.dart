class HomeIndex {
  String message;
  int code;
  DataBean data;

  HomeIndex({this.message, this.code, this.data});

  HomeIndex.fromJson(Map<String, dynamic> json) {    
    this.message = json['message'];
    this.code = json['code'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

class DataBean {
  HospitalBean hospital;
  List<BannerListBean> banner;
  List<ListDoctorListBean> listDoctor;
  List<ListHotArticleListBean> listHotArticle;
  List<ListOfficeListBean> listOffice;

  DataBean({this.hospital, this.banner, this.listDoctor, this.listHotArticle, this.listOffice});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.hospital = json['hospital'] != null ? HospitalBean.fromJson(json['hospital']) : null;
    this.banner = (json['banner'] as List)!=null?(json['banner'] as List).map((i) => BannerListBean.fromJson(i)).toList():null;
    this.listDoctor = (json['list_doctor'] as List)!=null?(json['list_doctor'] as List).map((i) => ListDoctorListBean.fromJson(i)).toList():null;
    this.listHotArticle = (json['list_hot_article'] as List)!=null?(json['list_hot_article'] as List).map((i) => ListHotArticleListBean.fromJson(i)).toList():null;
    this.listOffice = (json['list_office'] as List)!=null?(json['list_office'] as List).map((i) => ListOfficeListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospital != null) {
      data['hospital'] = this.hospital.toJson();
    }
    data['banner'] = this.banner != null?this.banner.map((i) => i.toJson()).toList():null;
    data['list_doctor'] = this.listDoctor != null?this.listDoctor.map((i) => i.toJson()).toList():null;
    data['list_hot_article'] = this.listHotArticle != null?this.listHotArticle.map((i) => i.toJson()).toList():null;
    data['list_office'] = this.listOffice != null?this.listOffice.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class HospitalBean {
  String img;
  String url;

  HospitalBean({this.img, this.url});

  HospitalBean.fromJson(Map<String, dynamic> json) {    
    this.img = json['img'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['url'] = this.url;
    return data;
  }
}

class BannerListBean {
  String img;
  String url;

  BannerListBean({this.img, this.url});

  BannerListBean.fromJson(Map<String, dynamic> json) {    
    this.img = json['img'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['url'] = this.url;
    return data;
  }
}

class ListDoctorListBean {
  String avatar;
  String brief;
  String keshi;
  String linkUrl;
  String name;
  String position;
  int id;
  List<String> label;

  ListDoctorListBean({this.avatar, this.brief, this.keshi, this.linkUrl, this.name, this.position, this.id, this.label});

  ListDoctorListBean.fromJson(Map<String, dynamic> json) {    
    this.avatar = json['avatar'];
    this.brief = json['brief'];
    this.keshi = json['keshi'];
    this.linkUrl = json['link_url'];
    this.name = json['name'];
    this.position = json['position'];
    this.id = json['id'];

    List<dynamic> labelList = json['label'];
    this.label = new List();
    this.label.addAll(labelList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['brief'] = this.brief;
    data['keshi'] = this.keshi;
    data['link_url'] = this.linkUrl;
    data['name'] = this.name;
    data['position'] = this.position;
    data['id'] = this.id;
    data['label'] = this.label;
    return data;
  }
}

class ListHotArticleListBean {
  String articleCover;
  String articleDescription;
  String articleTag;
  String articleTitle;
  String articleUrl;
  int categoryId;
  int id;
  int status;

  ListHotArticleListBean({this.articleCover, this.articleDescription, this.articleTag, this.articleTitle, this.articleUrl, this.categoryId, this.id, this.status});

  ListHotArticleListBean.fromJson(Map<String, dynamic> json) {    
    this.articleCover = json['article_cover'];
    this.articleDescription = json['article_description'];
    this.articleTag = json['article_tag'];
    this.articleTitle = json['article_title'];
    this.articleUrl = json['article_url'];
    this.categoryId = json['category_id'];
    this.id = json['id'];
    this.status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_cover'] = this.articleCover;
    data['article_description'] = this.articleDescription;
    data['article_tag'] = this.articleTag;
    data['article_title'] = this.articleTitle;
    data['article_url'] = this.articleUrl;
    data['category_id'] = this.categoryId;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class ListOfficeListBean {
  String name;
  String officeImg;
  String officeUrl;
  int id;

  ListOfficeListBean({this.name, this.officeImg, this.officeUrl, this.id});

  ListOfficeListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.officeImg = json['office_img'];
    this.officeUrl = json['office_url'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['office_img'] = this.officeImg;
    data['office_url'] = this.officeUrl;
    data['id'] = this.id;
    return data;
  }
}
