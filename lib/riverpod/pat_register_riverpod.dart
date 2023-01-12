import 'dart:developer';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/service/pat_register_service.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:grock/grock.dart';

class PatRegisterRiverpod extends ChangeNotifier {
  final service = pat_register_service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();

  void fetch() {
    loadingPopup();
    if (name.text != "" &&
        pass.text != "" &&
        email.text != "" &&
        gender.text != "") {
      service.pat_register_call(json: {
        'PatientName': name.text,
        'PatientMail': email.text,
        'PatientPassword': int.parse(pass.text),
        'PatientPhoto': null,
        'PatientGender': gender.text,
        'PatientOnline': 0
      }).then((value) {
        if (value == true) {
          Grock.back();
          Grock.toRemove(HomePage());
          Grock.snackBar(
              title: "Kayıt Başarılı",
              description: "Hesabınıza Giriş Yapabilirsiniz.");
        } else {
          Grock.back();
          Grock.snackBar(title: "Hata", description: "Tekrar Deneyin.");
        }
      });
    } else {
      Grock.back();
      Grock.snackBar(
          title: "Bilgiler Eksiksiz Olmalıdır", description: "Tekrar Deneyin.");
    }
  }
}
