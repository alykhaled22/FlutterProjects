import 'package:basketball_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasketballCounterApp());
}

// ignore: must_be_immutable
class BasketballCounterApp extends StatefulWidget {
  const BasketballCounterApp({super.key});

  @override
  State<BasketballCounterApp> createState() => _BasketballCounterAppState();
}

class _BasketballCounterAppState extends State<BasketballCounterApp> {
  
  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Points Counter",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Team A",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        '$teamAPoints',
                        style: const TextStyle(
                          fontSize: 80,
                        ),
                      ),
                      CustomButton(
                        onPressd: () {
                          teamAPoints++;
                          setState(
                            () {},
                          );
                        },
                        text: "Add 1 point",
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      CustomButton(
                        onPressd: () {
                          teamAPoints += 2;
                          setState(
                            () {},
                          );
                        },
                        text: "Add 2 point",
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      CustomButton(
                          onPressd: () {
                            teamAPoints += 3;
                            setState(() {});
                          },
                          text: "Add 3 point"),
                    ],
                  ),
                  const SizedBox(
                    height: 450,
                    child: VerticalDivider(
                      width: 5,
                      thickness: 0.2,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        "Team B",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        "$teamBPoints",
                        style: const TextStyle(
                          fontSize: 80,
                        ),
                      ),
                      CustomButton(
                        onPressd: () {
                          teamBPoints++;
                          setState(() {});
                        },
                        text: "Add 1 point",
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      CustomButton(
                        onPressd: () {
                          teamBPoints += 2;
                          setState(() {});
                        },
                        text: "Add 2 point",
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      CustomButton(
                        onPressd: () {
                          teamBPoints += 3;
                          setState(() {});
                        },
                        text: "Add 3 point",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              onPressd: () {
                teamAPoints = 0;
                teamBPoints = 0;
                setState(() {});
              },
              text: "Reset",
            ),
          ],
        ),
      ),
    );
  }
}
