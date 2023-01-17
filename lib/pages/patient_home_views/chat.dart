import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:doktorhasta/service/chat_update_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Chat extends ConsumerStatefulWidget {
  Chat(
      {Key? key,
      required this.pat,
      required this.doc,
      required this.messageList})
      : super(key: key);
  List<MessageModel> messageList;
  PatientDataModel pat;
  DoctorDataModel doc;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatState(pat: pat, doc: doc, messageList: messageList);
}

class _ChatState extends ConsumerState<Chat> {
  _ChatState({required this.pat, required this.doc, required this.messageList});
  List<MessageModel> messageList;
  PatientDataModel pat;
  DoctorDataModel doc;
  final service = Chat_Update_service();

  late List<MessageModel> newlist;

  ScrollController sccontroller = ScrollController();

  void _onItemTapped(List<MessageModel> newlist) {
    setState(() {
      messageList = newlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Center(child: Text("MESAJLAR")),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 12,
            child: ListView.builder(
              controller: ScrollController(
                  initialScrollOffset: messageList.length.toDouble() * 55),
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.blueGrey,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    title: Text(messageList[index].senderName.toUpperCase(),
                        textAlign: messageList[index].senderID == pat.patientID
                            ? TextAlign.right
                            : TextAlign.left),
                    subtitle: Text(messageList[index].message.toUpperCase(),
                        textAlign: messageList[index].senderID == pat.patientID
                            ? TextAlign.right
                            : TextAlign.left),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 10, bottom: 2),
            alignment: Alignment.bottomCenter,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
                controller: ref.read(sendMessageRiverpod).mesaj,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        ref.read(sendMessageRiverpod).fetch(pat: pat, doc: doc);
                        service
                            .message_update_call(
                                sender: pat.patientID, reciever: doc.doctorID)
                            .then((value) {
                          newlist = value;
                          _onItemTapped(newlist);
                          ref.read(sendMessageRiverpod).mesaj.clear();
                        });
                      }),
                )),
          ),
        ],
      ),
    );
  }
}
