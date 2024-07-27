import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat/widgets/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static bool darkmode = false;
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              "assets/images/scholar.png",
              height: 50,
            ),
            const Text(
              "Scolar Chat",
              style: TextStyle(
                fontFamily: "Pacifico",
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
              setState(() {
                HomePage.darkmode = !HomePage.darkmode;
              });
            },
            icon: Icon(
              HomePage.darkmode ? Icons.light_mode : Icons.dark_mode,
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          Contact(),
          Contact(),
          Contact(),
          Contact(),
          Contact(),
          Contact(),
          Contact(),
          Contact(),
          Contact(),
        ],
      ),
    );
  }
}
