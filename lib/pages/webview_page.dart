import 'package:flutter/material.dart';
import 'package:news_app/services/pigeon.g.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final Article article;

  const WebViewPage(
    this.article, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: _webView(),
      );

  Widget _webView() => WebView(
        key: Key('webview_${article.url}'),
        initialUrl: article.url,
      );
}
