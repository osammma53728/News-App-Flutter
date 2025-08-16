import 'package:dio/dio.dart';
import 'package:test_flutter/models/article.dart';

class NewsService {
  Dio dio;
  String category ;
  NewsService(  {required this.dio , this.category = 'health'});

   Future<List<Article>>  getNews() async {
    var response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=26b9a18ddbb1400c891a08632b4c5327'

    );
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<Article> articlesList = [];

    for (var article in articles) {
      articlesList.add(
        Article(
          title: article['title'] ?? 'No Title',
          description: article['description'] ?? 'No Description',
          urlToImage: article['urlToImage'] ?? '',
        ),
      );
    }
    return articlesList;
  }
}



