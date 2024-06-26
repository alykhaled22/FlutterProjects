import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';
import 'package:toku_app/models/obj.dart';

class FamilyMemberPage extends StatelessWidget {
  const FamilyMemberPage({super.key});

  final List<Obj> familyMembers = const [
    Obj(
      image: "assets/images/family_members/family_father.png",
      jpName: "Chichioya",
      enName: "Father",
      sound: 'sounds/family_members/father.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_mother.png",
      jpName: "Hahaoya",
      enName: "Mother",
      sound: 'sounds/family_members/mother.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_grandfather.png",
      jpName: "Ojisan",
      enName: "Grand Father",
      sound: 'sounds/family_members/grand father.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_grandmother.png",
      jpName: "Sobo",
      enName: "Grand Mother",
      sound: 'sounds/family_members/grand mother.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_son.png",
      jpName: "Musuko",
      enName: "Son",
      sound: 'sounds/family_members/son.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_daughter.png",
      jpName: "Musume",
      enName: "Daughter",
      sound: 'sounds/family_members/daughter.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_older_brother.png",
      jpName: "Nisan",
      enName: "Older Brother",
      sound: 'sounds/family_members/older brother.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_older_sister.png",
      jpName: "Ane",
      enName: "Older Sister",
      sound: 'sounds/family_members/older sister.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_younger_brother.png",
      jpName: "Otouto",
      enName: "Younger Brother",
      sound: 'sounds/family_members/younger brother.wav',
    ),
    Obj(
      image: "assets/images/family_members/family_younger_sister.png",
      jpName: "Imouto",
      enName: "Younger Sister",
      sound: 'sounds/family_members/younger sister.wav',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FamilyMembers Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: const Color(0xff46322B),
      ),
      body: ListView.builder(
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            return Item(
              obj: familyMembers[index],
              color: const Color(0xff558837),
            );
          }),
    );
  }
}
