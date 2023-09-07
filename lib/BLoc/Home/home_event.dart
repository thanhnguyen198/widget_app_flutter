import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

@immutable
class GetNewsEvent extends HomeEvent {
  final int page;
  const GetNewsEvent({required this.page});
}

@immutable
class RefreshNewsEvent extends HomeEvent {
  const RefreshNewsEvent();
}
