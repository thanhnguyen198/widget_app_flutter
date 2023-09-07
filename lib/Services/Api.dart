import 'package:dio/dio.dart';
import 'package:widget_app/Models/ApiResponse.dart';
import 'package:widget_app/Models/Login/LoginParameter.dart';
import 'package:widget_app/Models/Login/ResponseLogin.dart';
import 'package:widget_app/Models/News/NewsParameter.dart';
import 'package:widget_app/Models/News/ResponseNews.dart';

class Api {
  static var uri = "https://dev.kisekaeapp.com/api";
  static BaseOptions options = BaseOptions(
    baseUrl: uri,
    headers: {
      "Content-Type": "application/json;charset=utf-8",
      "X-Bundle-Id": "jp.nijisanji.widget.dev",
      "X-Estream-Signature": "a"
    },
  );
  Dio dio = Dio(options);

  Future<ResponseLogin?> login(LoginParameter parameter) async {
    try {
      final response = await dio.post('/v2/login', data: parameter.toJson());
      final loginRes = ApiResponse<ResponseLogin>.fromJson(
              response.data, ResponseLogin.fromJson)
          .data;
      return loginRes;
    } catch (e) {
      return null;
    }
  }

  Future<List<ResponseNews>?> fetchNews(
      NewsParameter parameter, String token) async {
    try {
      final response = await dio.get(
        '/v1/news',
        queryParameters: parameter.toMap(),
        options: Options(headers: {'Authorization': token}),
      );
      return ApiResponse<ResponseNews>.fromJson(
              response.data, ResponseNews.fromJson)
          .datas;
    } catch (e) {
      return null;
    }
  }
}
