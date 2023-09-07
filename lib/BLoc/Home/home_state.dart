import 'package:equatable/equatable.dart';
import 'package:widget_app/Models/News/ResponseNews.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitState extends HomeState {
  const HomeInitState();

  @override
  List<Object> get props => [];
}

@immutable
class NewsState extends HomeState {
  final List<ResponseNews> news;
  const NewsState({required this.news});
  const NewsState.empty() : this(news: const []);
  @override
  List<Object> get props => [news];
}

class LoadingNewState extends HomeState {
  final bool isLoading;
  const LoadingNewState({required this.isLoading});
  const LoadingNewState.loading() : this(isLoading: true);
  const LoadingNewState.unLoading() : this(isLoading: false);
  @override
  List<Object> get props => [isLoading];
}
