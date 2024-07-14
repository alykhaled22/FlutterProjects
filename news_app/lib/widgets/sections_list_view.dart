import 'package:flutter/material.dart';
import 'package:news_app/models/sections_model.dart';
import 'package:news_app/widgets/sections.dart';

class SectionsListView extends StatelessWidget {
  const SectionsListView({super.key});

  final List<SectionsModel> sections = const [
    SectionsModel(
      image: "assets/general.png",
      text: "General",
    ),
    SectionsModel(
      image: "assets/business.jpg",
      text: "Business",
    ),
    SectionsModel(
      image: "assets/entertainment.png",
      text: "Entertainment",
    ),
    SectionsModel(
      image: "assets/health.jpeg",
      text: "Health",
    ),
    SectionsModel(
      image: "assets/sports.jpg",
      text: "Sports",
    ),
    SectionsModel(
      image: "assets/tech.jpg",
      text: "Technology",
    ),
    SectionsModel(
      image: "assets/science.jpeg",
      text: "Science",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return Sections(section: sections[index]);
        },
      ),
    );
  }
}
