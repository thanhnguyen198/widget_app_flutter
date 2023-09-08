import 'package:bloc/bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:widget_app/utils/prefs.dart';
import '../../models/news/newsParameter.dart';
import '../../models/news/responseNews.dart';
import '../../services/api.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final api = Api();
  List<ResponseNews> news = [];
  HomeBloc() : super(const HomeInitState()) {
    on(_onGetNews);
    on(_onRefreshNews);
  }

  _onGetNews(GetNewsEvent event, Emitter<HomeState> emit) async {
    final news = await _fetchNews(page: event.page);
    emit(NewsState(news: news ?? []));
  }

  _onRefreshNews(RefreshNewsEvent event, Emitter<HomeState> emit) async {
    final news = await _fetchNews(page: 1, isRefreseh: true);
    emit(NewsState(news: news ?? []));
  }

  Future<List<ResponseNews>?> _fetchNews(
      {required page, bool isRefreseh = false}) async {
    if (!isRefreseh) {
      EasyLoading.show(status: 'Loading...');
    }
    try {
      final responseNews = await api.fetchNews(
        NewsParameter(page),
        Prefs.getString('accessToken') ?? '',
      );
      return responseNews;
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
    return null;
  }
}
