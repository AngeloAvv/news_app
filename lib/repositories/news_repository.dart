import 'package:news_app/services/pigeon.g.dart';

class NewsRepository {
  final ArticleApi newsService;

  NewsRepository({required this.newsService});

  Future<List<Article?>> get news => newsService.articles();
}
