import 'package:flutter/material.dart';
import 'package:news_app/services/pigeon.g.dart';

class ArticleWidget extends StatelessWidget {
  final Article? article;
  final VoidCallback? onTap;

  const ArticleWidget(
    this.article, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(article?.title ?? ''),
        subtitle: Text(
          article?.descr ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: article?.urlToImage != null
            ? Image.network(article!.urlToImage!)
            : null,
        onTap: onTap,
      );
}
