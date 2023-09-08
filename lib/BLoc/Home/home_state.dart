import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/news/responseNews.dart';

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
