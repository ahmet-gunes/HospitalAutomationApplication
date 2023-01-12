import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/service/patient_login_service.dart';
import 'package:grock/grock.dart';
import 'package:doktorhasta/pages/patient_main_page.dart';

class PatLoginRiverpod extends ChangeNotifier {
  final service = pat_login_service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void fetch() {
    loadingPopup();
    if (pass.text != "" && email.text != "") {
      service
          .pat_login_call(email: email.text, pass: int.parse(pass.text))
          .then((value) {
        if (value != null) {
          Grock.back();
          Grock.toRemove(PatientMainPage(
            pat: value,
          ));
        } else {
          Grock.back();
          Grock.snackBar(
              title: "Kullanıcı Adı veya Parola Hatalı",
              description: "Tekrar Deneyin.");
        }
      });
    } else {
      Grock.back();
      Grock.snackBar(
          title: "Kullanıcı Adı veya Parola Boş Olamaz",
          description: "Tekrar Deneyin.");
    }
  }
}
