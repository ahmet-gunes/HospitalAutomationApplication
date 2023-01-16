import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/service/doc_login_service.dart';
import 'package:grock/grock.dart';
import '../pages/doc_main_page.dart';

class DocLoginRiverpod extends ChangeNotifier {
  final service = Doc_login_service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void fetch() {
    loadingPopup();
    // ignore: unrelated_type_equality_checks
    if (pass.text != "" && email.text != "") {
      service
          .doc_login_call(email: email.text, pass: int.parse(pass.text))
          .then((value) {
        if (value != null) {
          Grock.back();
          Grock.to(DoctorMainPage(
            doc: value,
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
