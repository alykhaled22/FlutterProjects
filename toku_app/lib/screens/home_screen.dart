import 'package:flutter/material.dart';
import 'package:toku_app/components/category.dart';
import 'package:toku_app/screens/color_screen.dart';
import 'package:toku_app/screens/familymembers_page.dart';
import 'package:toku_app/screens/numbers_page.dart';
import 'package:toku_app/screens/phrases_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 246, 219),
      appBar: AppBar(
        title: const Text(
          "ToKu",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: const Color(0xff46322B),
      ),
      body: Column(
        children: [
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NumberPage();
              }));
            },
            text: "Numbers",
            color: const Color(0xffEF9235),
          ),
          Category(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FamilyMemberPage();
              }));
            },
            text: "FamilyMembers",
            color: const Color(0xff558837),
          ),
          Category(
            text: "Colors",
            color: const Color(0xff79359F),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ColorsPage();
              }));
            },
          ),
          Category(
            text: "Pharse",
            color: const Color(0xff50ADC7),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const PhrasesPage();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
