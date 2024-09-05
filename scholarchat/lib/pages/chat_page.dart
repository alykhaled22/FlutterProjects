import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat/pages/login_page.dart';
import 'package:scholarchat/widgets/chat_buble.dart';
import 'package:scholarchat/widgets/custom_text_field.dart';
import 'package:scholarchat/widgets/friend_chat_buble.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatelessWidget {

  static bool darkmode = false;

  static String id = "Chat_Page";
  final TextEditingController textController = TextEditingController();

  final scrollController = ScrollController();

  String? msg;

  final User user = FirebaseAuth.instance.currentUser!;

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Scolar Chat",
            style: TextStyle(
              fontFamily: "Pacifico",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
                // setState(() {
                //   darkmode = !darkmode;
                // });
              },
              icon: Icon(
                darkmode ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
            IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove('isLoggedIn');
                await Future.delayed(const Duration(seconds: 1));
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, LoginPage.id);
                }
              },
              icon: const Icon(Icons.logout),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messageList =
                    BlocProvider.of<ChatCubit>(context).messageList;
                return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == user.email
                          ? ChatBuble(
                              msg: messageList[index])
                          : FriendChatBuble(
                              msg: messageList[index]);
                    });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              child: CustomTextfield(
                onPressed: () {
                  if (msg != null) {
                    BlocProvider.of<ChatCubit>(context)
                        .sendMessage(msg: msg!, email: user.email!);
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
  }
}
