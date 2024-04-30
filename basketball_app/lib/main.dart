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
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamAPoints++;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 1 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        height: 27,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamAPoints += 2;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 2 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        height: 27,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamAPoints += 3;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 3 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
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
                          fontSize: 150,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamBPoints++;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 1 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        height: 27,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamBPoints += 2;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 2 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                      const SizedBox(
                        height: 27,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 50),
                            backgroundColor: Colors.orange,
                          ),
                          onPressed: () {
                            teamBPoints += 3;
                            setState(() {});
                          },
                          child: const Text(
                            "Add 3 point",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  teamAPoints = 0;
                  teamBPoints = 0;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
