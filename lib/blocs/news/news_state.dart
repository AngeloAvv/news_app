part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class FetchingNewsState extends NewsState {
  @override
  List<Object> get props => [];
}

class FetchedNewsState extends NewsState {
  final List<Article?> articles;

  const FetchedNewsState(this.articles);

  @override
  List<Object> get props => [articles];
}

class NoNewsState extends NewsState {
  @override
  List<Object> get props => [];
}

class ErrorNewsState extends NewsState {
  final String error;

  const ErrorNewsState(this.error);

  @override
  List<Object> get props => [error];
}
