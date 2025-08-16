import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: HomePage() ,debugShowCheckedModeBanner: false);
  }
}
