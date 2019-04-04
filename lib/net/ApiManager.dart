
import 'package:dio/dio.dart';

class ApiManager {
  Dio _dio;

  static ApiManager _instance;
  factory ApiManager() => _getInstance();

  /**
   * APP端： http://192.168.0.123:8012
   */
  ApiManager._internal() {
    var options = BaseOptions(
        baseUrl: "http://192.168.0.123:8012/",
        connectTimeout: 10000,
        receiveTimeout: 3000);
    options.headers["device"] = "84pgkNHhc0uOsa9e32vd";
    _dio = Dio(options);
  }

  static String getDevide(){

  }

  static ApiManager _getInstance() {
    if (_instance == null) {
      _instance = new ApiManager._internal();
    }
    return _instance;
  }


//http://192.168.0.123:8012/v1/medical_info/index?k_appversion=1.0.0&k_os=1&k_model=vivo%20Y85A
  /// 获取首页Banner
  Future<Response> getHomeIndex() async {
    try {
      Response response = await _dio.get("v1/medical_info/index",queryParameters: {"k_appversion":"1.0.0","k_os":"1","k_model":"vivo%20Y85A"});
      return response;
    } catch (e) {
      return null;
    }

  }
  /// 获取首页文章列表
  Future<Response> getHomeArticle(int page) async {
    try {
      Response response = await _dio.get("article/list/${page}/json");
      return response;
    } catch (e) {
      return null;
    }
  }

}