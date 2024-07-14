import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<NewsModel> news = [];
  // bool isLoading = true;

  // @override
  // void initState() {
  //   getNews();
  //   super.initState();
  // }

  // Future<void> getNews() async {
  //   news = await NewsApi(dio: Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }

  dynamic future;
  @override
  void initState() {
    super.initState();
    future = NewsApi(dio: Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Newslistview(news: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Oops there was an Error, Please try again later :)",
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
