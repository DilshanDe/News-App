import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';

class NewsDeatils extends StatelessWidget {
  final NewsArticle newsArticle;
  const NewsDeatils({super.key, required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
      ),
      body: Column(),
    );
  }
}
