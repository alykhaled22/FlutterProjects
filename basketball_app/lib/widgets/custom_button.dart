import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressd, required this.text});

  final VoidCallback onPressd;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 50),
          backgroundColor: Colors.orange,
        ),
        onPressed: onPressd,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ));
  }
}
