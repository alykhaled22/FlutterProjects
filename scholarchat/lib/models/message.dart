import 'package:intl/intl.dart';
import 'package:scholarchat/constant.dart';

class Message {
  final String text;
  final String time;
  final String id;

  Message({
    required this.text,
    required this.time,
    required this.id,
  });

  factory Message.fromJson(jsonData) {
    return Message(
      text: jsonData[kMessage],
      id: jsonData[kID],
      time:  DateFormat('hh:mm a').format(jsonData[kTime].toDate()),
    );
  }
}
