import 'package:widget_app/models/news/new.dart';

import '../services/service.dart';

abstract class HomeRepo {
  Future<List<New>> getNews(int page);
}

class HomeRepoImpl implements HomeRepo {
  HomeApi get api => HomeApiImpl.instance.api;

  @override
  Future<List<New>> getNews(int page) {
    return api.getNews(page);
  }
}
