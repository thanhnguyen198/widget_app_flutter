import 'package:bloc/bloc.dart';
import 'package:widget_app/BLoc/Home/home_event.dart';
import 'package:widget_app/BLoc/Home/home_state.dart';
import 'package:widget_app/Models/News/ResponseNews.dart';
import 'package:widget_app/Models/Login/LoginParameter.dart';
import 'package:widget_app/Models/News/NewsParameter.dart';
import 'package:widget_app/Services/Api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      final param = LoginParameter(
          'D82E4D7D-4306-4D2A-B72F-1AF58BC9C818',
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.oT7kSePnYs7eVIsRIzIi0UEC7XBclsrO3qrnXwic8Zg',
          '1.1.3',
          'iOS',
          '16.6',
          'iPhone X');
      final responseLogin = await api.login(param);
      final responseNews = await api.fetchNews(
        NewsParameter(page),
        responseLogin?.accessToken ?? '',
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
