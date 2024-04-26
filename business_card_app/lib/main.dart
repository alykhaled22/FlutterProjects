import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BusniessCardApp());
}

class BusniessCardApp extends StatelessWidget {
  const BusniessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: const Color(0xFF2B475E),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage("images/tharwat.png"),
                  ),
                ),
                Text("Aly Khaled",
                    style: GoogleFonts.allan(
                      color: Colors.white,
                      fontSize: 38,
                    )),
                const Text(
                  "FLUTTER DEVELOPER",
                  style: TextStyle(
                    color: Color(0xFF6C8090),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Color(0xFF6C8090),
                  thickness: 0.5,
                  indent: 60,
                  endIndent: 60,
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      size: 35,
                      color: Color(0xFF2B475E),
                    ),
                    title: Text(
                      "(+20) 1111168793",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 35,
                      color: Color(0xFF2B475E),
                    ),
                    title: Text(
                      "alykhaled936@gmail.com",
                      style: GoogleFonts.alikeAngular(
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
