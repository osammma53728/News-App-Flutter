import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/models/article.dart';
import 'package:test_flutter/services/news_service.dart';
import 'package:test_flutter/widgets/categories.dart';
import 'package:test_flutter/widgets/category_card.dart';
import 'package:test_flutter/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchGeneralNews();
  }


  void fetchGeneralNews() async {
    NewsService newsService = NewsService(dio: Dio(), category: 'general');
    final fetchedArticles = await newsService.getNews();
    setState(() {
      articles = fetchedArticles;
    });
  }

  void fetchNewsByCategory(String category) async {
    NewsService newsService = NewsService(dio: Dio(), category: category);
    final fetchedArticles = await newsService.getNews();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NewsListPage(
          articles: fetchedArticles,
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      "general",
      "business",
      "entertainment",
      "health",
      "science",
      "sports",
      "technology"
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("📰 News Cloud"),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    child: CategoryCard(title: category),
                    onTap: () {
                      if (category == "general") {
                        fetchGeneralNews();
                      } else {
                        fetchNewsByCategory(category);
                      }
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "General News",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ...articles.map((article) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: NewsCard(
                  imgUrl: article.urlToImage ?? '',
                  title: article.title ?? 'No Title',
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
