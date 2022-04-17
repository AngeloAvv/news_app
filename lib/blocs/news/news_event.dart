part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNewsEvent extends NewsEvent {
  @override
  List<Object> get props => [];
}