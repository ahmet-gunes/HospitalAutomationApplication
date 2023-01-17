import 'dart:developer';

import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/pages/patient_home_views/chat.dart';
import 'package:doktorhasta/service/chat_update_service.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class ChatUpdateRiverpod extends ChangeNotifier {
  late PatientDataModel pat;
  late MessageModel message;
  final service = Chat_Update_service();

  void fetch({required DoctorDataModel doctor}) async {
    loadingPopup();
    service
        .message_update_call(sender: pat.patientID, reciever: doctor.doctorID)
        .then((value) {
      Grock.to(Chat(messageList: value));
    });
    /* if (value.isNotEmpty) {
        Grock.back();
        Grock.to(Chat(messageList: value));
        Grock.snackBar(title: "Sohbete aktarıldı", description: "");
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "Tekrar Deneyin.");
      } */
  }
}
