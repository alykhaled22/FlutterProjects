import 'package:flutter/material.dart';
import 'package:scholarchat/models/message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.msg});

  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * 0.75, // Restrict the width
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Color(0xff005C4B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: RichText(
                text: TextSpan(
                  children: [
                    // Real message
                    TextSpan(
                      text: "${msg.text}    ",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    // Fake additionalInfo as placeholder
                    TextSpan(
                      text: msg.time,
                      style: const TextStyle(
                        color: Colors.transparent,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Real additionalInfo
            Positioned(
              right: 8.0,
              bottom: 4.0,
              child: Text(
                msg.time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
