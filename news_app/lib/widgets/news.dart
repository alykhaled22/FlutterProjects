import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/image_url.dart';

class News extends StatelessWidget {
  const News({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageUrl(imageUrl: news.image,)
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.mainText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.secText ?? "",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
