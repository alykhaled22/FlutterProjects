import 'package:flutter/material.dart';
import 'package:scholarchat/pages/chat_page.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 12),
        width: double.infinity,
        height: 100,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 8, right: 16),
          onTap: () {
            const Duration(seconds: 222);
            Navigator.pushNamed(context, ChatPage.id);
          },
          leading: const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage("assets/images/aly.jpeg"),
          ),
          title: const Text(
            overflow: TextOverflow.ellipsis,
            "7oda",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            overflow: TextOverflow.ellipsis,
            "عامل اي",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Text(
            "06:26 pm",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ));
  }
}
