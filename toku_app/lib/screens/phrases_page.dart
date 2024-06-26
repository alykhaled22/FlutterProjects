import 'package:flutter/material.dart';
import 'package:toku_app/components/phrases_item.dart';
import 'package:toku_app/models/obj.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});

  final List<Obj> phrases = const [
    Obj(
      jpName: "Kimasu ka",
      enName: "Are you coming?",
      sound: 'sounds/phrases/are_you_coming.wav',
    ),
    Obj(
      jpName: "Kodoku suru koto o wasurenaide kudasai",
      enName: "Don't forget to subscribe.",
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
    ),
    Obj(
      jpName: "Go kibun wa ikagadesu ka",
      enName: "How are you feeling?",
      sound: 'sounds/phrases/how_are_you_feeling.wav',
    ),
    Obj(
      jpName: "Watashi wa anime ga daisukidesu.",
      enName: "I love anime.",
      sound: 'sounds/phrases/i_love_anime.wav',
    ),
    Obj(
      jpName: "Watashi wa puroguramingu ga dasukides",
      enName: "I love programming.",
      sound: 'sounds/phrases/i_love_programming.wav',
    ),
    Obj(
      jpName: "Puroguramingu wa kantandesu",
      enName: "Programming is easy.",
      sound: 'sounds/phrases/programming_is_easy.wav',
    ),
    Obj(
      jpName: "Namea wa nandesu ka",
      enName: "What is your name?",
      sound: 'sounds/phrases/what_is_your_name.wav',
    ),
    Obj(
      jpName: "Doko ni iku no",
      enName: "Where are you going?",
      sound: 'sounds/phrases/where_are_you_going.wav',
    ),
    Obj(
      jpName: "hai watashi wa rai te i masu",
      enName: "Yes, I'm coming.",
      sound: 'sounds/phrases/yes_im_coming.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Phrases Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: const Color(0xff46322B),
      ),
      body: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            return PhrasesItem(
              obj: phrases[index],
              color: const Color(0xff50ADC7),
            );
          }),
    );
  }
}
