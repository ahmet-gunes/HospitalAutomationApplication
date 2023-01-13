import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/pages/patient_home.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/service/patient_login_service.dart';
import 'package:grock/grock.dart';

class PatLoginRiverpod extends ChangeNotifier {
  final service = Pat_Login_Service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void fetch() {
    loadingPopup();
    if (pass.text != "" && email.text != "") {
      service
          .pat_login_call(email: email.text, pass: int.parse(pass.text))
          .then((value) {
        if (value != null) {
          PatientDataModel pat = value;
          Grock.back();
          Grock.toRemove(Patient_Home(
            pat: pat,
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
