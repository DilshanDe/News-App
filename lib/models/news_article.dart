import 'package:flutter/foundation.dart';

class NewsArticle {
  final String author;
  final String description;
  final String title;
  final String url;
  final String urlToImage;
  final String publishAt;
  final String content;

  const NewsArticle({
    required this.author,
    required this.description,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'] ?? "",
      description: json['description'] ?? "",
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}
