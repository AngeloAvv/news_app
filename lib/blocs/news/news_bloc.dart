import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/services/pigeon.g.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(FetchingNewsState()) {
    on<FetchNewsEvent>(_mapFetchNewsEventToState);
  }

  void fetchNews() => add(FetchNewsEvent());

  void _mapFetchNewsEventToState(_, Emitter<NewsState> emit) async {
    emit(FetchingNewsState());

    List<Article?>? articles;
    try {
      articles = await newsRepository.news;
    } catch (error) {
      emit(ErrorNewsState(error.toString()));
    }

    if (articles != null) {
      if (articles.isNotEmpty) {
        emit(FetchedNewsState(articles));
      } else {
        emit(NoNewsState());
      }
    } else {
      const ErrorNewsState('Generic error');
    }
  }
}
