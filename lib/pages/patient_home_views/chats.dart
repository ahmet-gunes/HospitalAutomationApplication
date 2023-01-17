import 'dart:developer';

import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/service/chat_update_service.dart';
import 'package:doktorhasta/service/message_chat_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Chats extends ConsumerStatefulWidget {
  Chats({Key? key, required this.pat}) : super(key: key);
  PatientDataModel pat;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatsState(pat: pat);
}

class _ChatsState extends ConsumerState<Chats> {
  final service = Message_Chat_List();
  _ChatsState({required this.pat});
  PatientDataModel pat;
  @override
  void initState() {
    super.initState();
    service.message_update_call(sender: pat.patientID).then((value) {
      for (int i = 0; i < value.length; i++) {
        if (messageList.contains(value[i]) == true) {
          messageList.add(value[i]);
        } else {
          continue;
        }
      }
      for (int i = 0; i < messageList.length; i++) {
        log(messageList[i].toString());
      }
    });
  }

  List<MessageModel> messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(messageList[index].recieverID.toString()),
          );
        },
      ),
    );
  }
}
