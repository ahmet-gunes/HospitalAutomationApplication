import 'dart:convert';
import 'dart:developer';

import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/pages/doc_home_views/chat.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:doktorhasta/service/chat_update_service.dart';
import 'package:doktorhasta/service/doc_chat_update_service.dart';
import 'package:doktorhasta/service/get_doc_service.dart';
import 'package:doktorhasta/service/get_pat_service.dart';
import 'package:doktorhasta/service/message_chat_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class Chats extends ConsumerStatefulWidget {
  Chats({Key? key, required this.doc}) : super(key: key);
  DoctorDataModel doc;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatsState(doc: doc);
}

class _ChatsState extends ConsumerState<Chats> {
  final service = Doc_Message_Chat_List();
  final service2 = get_pat_service();
  final service3 = Chat_Update_service();
  _ChatsState({required this.doc});
  DoctorDataModel doc;
  @override
  void initState() {
    super.initState();
    service.message_update_call(reciever: doc.doctorID).then((value) {
      senderID = [];
      for (int i = 0; i < value.length; i++) {
        if (senderID.contains(value[i].senderID) == false) {
          senderID.add(int.parse(value[i].senderID.toString()));
          messages.add(value[i]);
        } else {
          continue;
        }
      }
      for (int i = 0; i < senderID.length; i++) {
        service2.get_pat_call(id: messages[i].senderID).then((value) {
          patlist.add(value);
        });
      }
    });
  }

  List<PatientDataModel> patlist = [];
  List<int> senderID = [];
  List<MessageModel> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: senderID.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              service3
                  .message_update_call(
                      sender: doc.doctorID, reciever: patlist[index].patientID)
                  .then((value) {
                Grock.to(
                    Chat(pat: patlist[index], doc: doc, messageList: value));
              });
            },
            child: Card(
              child: Row(children: [
                ClipOval(
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(35),
                      child: (patlist[index].patientPhoto != null)
                          ? Image.memory(
                              base64Decode(patlist[index].patientPhoto!),
                              fit: BoxFit.fill,
                            )
                          : (patlist[index].patientGender.toLowerCase() ==
                                  "erkek")
                              ? Image.asset("assets/images/male.png")
                              : Image.asset("assets/images/female.png")),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(patlist[index].patientName),
                      Text("(...)"),
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
