import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/constant.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/news_details.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<NewsArticle> _newsArtticles = [];
  void getNews() async {
    final response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=tesla&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      final List<dynamic> articles = json['articles'];

      final articlesModelList = articles.map((article) {
        return NewsArticle.fromJson(article);
      }).toList();
      setState(() {
        _newsArtticles = articlesModelList;
      });

      print(_newsArtticles);
    } else {
      throw Exception('Fail to load News');
    }
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: ListView.builder(
        itemCount: _newsArtticles.length,
        itemBuilder: (context, index) {
          NewsArticle article = _newsArtticles[index];

          if (article.title == '[Removed]' || article.urlToImage == '') {
            return Container();
          }
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NewsDeatils(
                  newsArticle: article,
                );
              }));
            },
            leading: Image.network(
              _newsArtticles[index].urlToImage,
              width: 100,
              fit: BoxFit.fill,
            ),
            title: Text(article.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: Text(
              article.publishAt,
              style: TextStyle(fontSize: 10),
            ),
          );
        },
      ),
    );
  }
}
