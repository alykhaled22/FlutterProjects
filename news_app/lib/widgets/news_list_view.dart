import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news.dart';

class Newslistview extends StatelessWidget {
  final List<NewsModel> news;

  const Newslistview({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: news.length,
            (context, index) {
      return News(news: news[index]);
    }));
  }
}
