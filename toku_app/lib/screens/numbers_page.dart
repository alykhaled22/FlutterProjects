import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';
import 'package:toku_app/models/obj.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  final List<Obj> numbers = const [
    Obj(
      image: "assets/images/numbers/number_one.png",
      jpName: "Ichi",
      enName: "One",
      sound: 'sounds/numbers/number_one_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_two.png",
      jpName: "Ni",
      enName: "Two",
      sound: 'sounds/numbers/number_two_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_three.png",
      jpName: "San",
      enName: "Three",
      sound: 'sounds/numbers/number_three_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_four.png",
      jpName: "Shi",
      enName: "Four",
      sound: 'sounds/numbers/number_four_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_five.png",
      jpName: "Go",
      enName: "Five",
      sound: 'sounds/numbers/number_five_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_six.png",
      jpName: "Roku",
      enName: "Six",
      sound: 'sounds/numbers/number_six_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_seven.png",
      jpName: "Shichi",
      enName: "Seven",
      sound: 'sounds/numbers/number_seven_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_eight.png",
      jpName: "Hachi",
      enName: "Eight",
      sound: 'sounds/numbers/number_eight_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_nine.png",
      jpName: "Kyuu",
      enName: "Nine",
      sound: 'sounds/numbers/number_nine_sound.mp3',
    ),
    Obj(
      image: "assets/images/numbers/number_ten.png",
      jpName: "Juu",
      enName: "Ten",
      sound: 'sounds/numbers/number_ten_sound.mp3',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Number Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: const Color(0xff46322B),
      ),
      body: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return Item(
              obj: numbers[index],
              color: const Color(0xffEF9235),
            );
          }),
    );
  }
}
