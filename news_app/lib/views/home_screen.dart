import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import 'package:news_app/widgets/sections_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: "News ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Cloud",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SectionsListView()),
              const SliverToBoxAdapter(child: SizedBox(height: 30)),
              NewsListViewBuilder(category: category),
            ],
          ),
        ));
  }
}
