import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_bloc.dart';
import 'package:news_app/pages/webview_page.dart';
import 'package:news_app/services/pigeon.g.dart';
import 'package:news_app/widgets/article_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: _body(context),
      );

  Widget _body(BuildContext context) => BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is ErrorNewsState) {
            return _errorNewsState(state.error);
          } else if (state is FetchingNewsState) {
            return _loadingNewsState();
          } else if (state is NoNewsState) {
            return _noNewsState();
          } else if (state is FetchedNewsState) {
            return _articles(state.articles);
          }

          return Container();
        },
      );

  Widget _articles(List<Article?> articles) => ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) => ArticleWidget(
          articles[index],
          onTap: () => articles[index] != null
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WebViewPage(articles[index]!),
                  ),
                )
              : null,
        ),
      );

  Widget _errorNewsState(String error) => Center(
        child: Text(error),
      );

  Widget _noNewsState() => const Center(
        child: Text('No news available'),
      );

  Widget _loadingNewsState() => const Center(
        child: CircularProgressIndicator(),
      );
}
