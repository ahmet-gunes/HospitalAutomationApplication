import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Chat extends ConsumerStatefulWidget {
  Chat({Key? key, required this.messageList}) : super(key: key);
  List<MessageModel> messageList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatState(messageList: messageList);
}

class _ChatState extends ConsumerState<Chat> {
  _ChatState({required this.messageList});
  List<MessageModel> messageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        messageList[0].message,
      ),
    );
  }
}
