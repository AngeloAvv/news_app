import 'package:pigeon/pigeon.dart';

class Article {
  final String title;
  final String? descr;
  final String? urlToImage;
  final String url;
  final String? publishedAt;
  final String? content;

  const Article({
    required this.title,
    this.descr,
    this.urlToImage,
    required this.url,
    this.publishedAt,
    this.content,
  });
}

@HostApi()
abstract class ArticleApi {
  @async
  List<Article> articles();
}
