import 'dart:developer';
import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/service/chat_update_service.dart';
import 'package:doktorhasta/service/send_message_service.dart';
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';

class SendMessage extends ChangeNotifier {
  final service = SendMessageService();
  final service2 = Chat_Update_service();

  TextEditingController mesaj = TextEditingController();

  void fetch({required PatientDataModel pat, required DoctorDataModel doc}) {
    final MessageModel message = MessageModel(
      pat.patientID,
      doc.doctorID,
      pat.patientName,
      mesaj.text,
      null,
    );
    service.message_send_call(message: message).then((value) {
      if (value == true) {
        log("mesaj gönderildi");
        Grock.hideKeyboard();
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "Mesaj Gönderilemedi");
      }
    });
  }
}
