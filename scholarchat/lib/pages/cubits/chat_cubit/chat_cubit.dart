import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/constant.dart';
import 'package:scholarchat/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  List<Message> messageList = [];
  String? msg;

  void sendMessage({required String msg, required String email}) {
    messages.add(
      {
        kMessage: msg,
        kTime: DateTime.now(),
        'id': email,
      },
    );
  }

  void getMessages() {
    messages.orderBy(kTime, descending: true).snapshots().listen((event) {
      messageList.clear();

      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess());
    });
  }
}
