import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/pages/doc_main_page.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/service/doc_login_service.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:grock/grock.dart';
import '../service/doc_update_service.dart';
import '../service/pat_update_service.dart';

class PatUpdateRiverpod extends ChangeNotifier {
  final service = pat_update_service();
  late PatientDataModel patient;

  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  void fetch() {
    loadingPopup();
    service.pat_update_call(json: {
      'PatientName': name.text == "" ? patient.patientName : name.text,
      'PatientPassword':
          pass.text == "" ? patient.patientPassword : int.parse(pass.text),
      'PatientID': patient.patientID,
    }).then((value) {
      if (value == true) {
        Grock.back();
        Grock.to(const HomePage());
        Grock.snackBar(
            title: "Bilgiler Güncellendi", description: "Tekrar Giriş Yapın");
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "Tekrar Deneyin.");
      }
    });
  }
}
