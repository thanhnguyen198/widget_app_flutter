import 'package:bloc/bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:widget_app/api_repository/home_repository.dart';
import 'package:widget_app/models/news/new.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final HomeRepoImpl _homeRepo;

  List<New> news = [];
  HomeBloc({required HomeRepoImpl homeRepo}) : super(const HomeInitState()) {
    _homeRepo = homeRepo;
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

  Future<List<New>?> _fetchNews(
      {required page, bool isRefreseh = false}) async {
    if (!isRefreseh) {
      EasyLoading.show(status: 'Loading...');
    }
    try {
      final responseNews = await _homeRepo.getNews(page);
      return responseNews;
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
    return null;
  }
}
