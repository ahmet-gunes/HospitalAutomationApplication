import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/service/doc_login_service.dart';
import 'package:grock/grock.dart';
import '../pages/doc_main_page.dart';
import 'package:doktorhasta/pages/patient_main_page.dart';

class DocLoginRiverpod extends ChangeNotifier {
  final service = doc_login_service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void fetch() {
    loadingPopup();
    service
        .doc_login_call(email: email.text, pass: int.parse(pass.text))
        .then((value) {
      if (value != null) {
        Grock.back();
        Grock.toRemove(DoctorMainPage(
          doc: value,
        ));
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "Tekrar Deneyin.");
      }
    });
  }
}
