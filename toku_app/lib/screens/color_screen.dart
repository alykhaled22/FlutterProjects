import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';
import 'package:toku_app/models/obj.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

    final List<Obj> colors = const [
    Obj(
      sound: 'sounds/colors/black.wav',
      jpName: 'Burakku',
      enName: 'Black',
      image: 'assets/images/colors/color_black.png',
    ),
    Obj(
      sound: 'sounds/colors/brown.wav',
      jpName: 'Chairo',
      enName: 'Brown',
      image: 'assets/images/colors/color_brown.png',
    ),
    Obj(
      sound: 'sounds/colors/dusty yellow.wav',
      jpName: 'Hokori ppoi kiiro',
      enName: 'Dusty yellow',
      image: 'assets/images/colors/color_dusty_yellow.png',
    ),
    Obj(
      sound: 'sounds/colors/gray.wav',
      jpName: 'Gurē',
      enName: 'Gray',
      image: 'assets/images/colors/color_gray.png',
    ),
    Obj(
      sound: 'sounds/colors/green.wav',
      jpName: 'Midori',
      enName: 'Green',
      image: 'assets/images/colors/color_green.png',
    ),
    Obj(
      sound: 'sounds/colors/red.wav',
      jpName: 'Aka',
      enName: 'Red',
      image: 'assets/images/colors/color_red.png',
    ),
    Obj(
      sound: 'sounds/colors/white.wav',
      jpName: 'Shiro',
      enName: 'White',
      image: 'assets/images/colors/color_white.png',
    ),
    Obj(
      sound: 'sounds/colors/yellow.wav',
      jpName: 'Kiiro',
      enName: 'Yellow',
      image: 'assets/images/colors/yellow.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Colors Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: const Color(0xff46322B),
      ),
      body: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Item(
              obj: colors[index],
              color: const Color(0xff79359F),
            );
          }),
    );
  }
}
