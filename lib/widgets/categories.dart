import 'package:flutter/material.dart';
import 'package:test_flutter/models/article.dart';
import 'package:test_flutter/widgets/news_card.dart';

class NewsListPage extends StatelessWidget {
  final List<Article> articles;
  final String category;

  const NewsListPage({
    super.key,
    required this.articles,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News: $category"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: NewsCard(
              imgUrl: articles[index].urlToImage ?? '',
              title: articles[index].title ?? 'No Title',
            ),
          );
        },
      ),
    );
  }
}
