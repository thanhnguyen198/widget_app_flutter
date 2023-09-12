// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/news/new.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: "https://dev.kisekaeapp.com/api")
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @GET("/v1/news/page={page}")
  Future<List<New>> getNews(@Path("page") int page);
}

class HomeApiImpl {
  static final HomeApiImpl instance = HomeApiImpl._();
  HomeApiImpl._();
  late HomeApi _homeApi;

  HomeApi get api => _homeApi;
  Future<void> initHomeApi(Dio dio) async {
    _homeApi = HomeApi(dio);
  }
}
