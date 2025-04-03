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
      body: Column(
        children: [
          Image.network(
            newsArticle.urlToImage,
            height: 300,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsArticle.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      newsArticle.publishAt,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      newsArticle.author,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsArticle.content,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
