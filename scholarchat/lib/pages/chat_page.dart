import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat/constant.dart';
import 'package:scholarchat/models/message.dart';
import 'package:scholarchat/pages/login_page.dart';
import 'package:scholarchat/widgets/chat_buble.dart';
import 'package:scholarchat/widgets/custom_text_field.dart';
import 'package:scholarchat/widgets/friend_chat_buble.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static String id = "Chat_Page";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static bool darkmode = false;

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  final TextEditingController textController = TextEditingController();

  final scrollController = ScrollController();

  String? msg;

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kTime, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                  scrolledUnderElevation: 0.0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(
                    "Scolar Chat",
                    style: TextStyle(
                      // color: Colors.white,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.isDarkMode
                            ? Get.changeTheme(ThemeData.light())
                            : Get.changeTheme(ThemeData.dark());
                        setState(() {
                          darkmode = !darkmode;
                        });
                      },
                      icon: Icon(
                        darkmode ? Icons.light_mode : Icons.dark_mode,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.remove('isLoggedIn');
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.pushReplacementNamed(context, LoginPage.id);
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ]),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == user!.email
                              ? ChatBuble(msg: messageList[index])
                              : FriendChatBuble(msg: messageList[index]);
                        }),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 3),
                      child: CustomTextfield(
                        onPressed: () {
                          if (msg != null) {
                            messages.add(
                              {
                                kMessage: msg,
                                kTime: DateTime.now(),
                                'id': user!.email, // 42
                              },
                            );
                            msg = null;
                            textController.clear();
                            scrollController.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        },
                        onChange: (data) {
                          msg = data;
                        },
                        controller: textController,
                      )),
                ],
              ),
            );
          } else {
            return const Text("");
          }
        });
  }
}
