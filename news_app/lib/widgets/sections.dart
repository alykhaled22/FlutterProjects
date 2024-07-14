import 'package:flutter/material.dart';
import 'package:news_app/models/sections_model.dart';
import 'package:news_app/views/home_screen.dart';

class Sections extends StatelessWidget {
  const Sections({super.key, required this.section});

  final SectionsModel section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomeScreen(
            category: section.text,
          );
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        height: 130,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(section.image),
          ),
        ),
      ),
    );
  }
}
