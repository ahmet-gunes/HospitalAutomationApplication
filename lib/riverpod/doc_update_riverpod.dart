import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/doc_main_page.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/service/doc_login_service.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:grock/grock.dart';
import '../service/doc_update_service.dart';

class DocUpdateRiverpod extends ChangeNotifier {
  final service = doc_update_service();
  late DoctorDataModel doctor;

  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mastery1 = TextEditingController();
  TextEditingController discipline = TextEditingController();
  TextEditingController graduate = TextEditingController();
  TextEditingController workplace = TextEditingController();

  void fetch() {
    loadingPopup();
    service.doc_update_call(json: {
      'doctorName': name.text == "" ? doctor.doctorName : name.text,
      'doctorPassword':
          pass.text == "" ? doctor.doctorPassword : int.parse(pass.text),
      'doctorWorkplace':
          workplace.text == "" ? doctor.doctorWorkplace : workplace.text,
      'doctorGraduate':
          graduate.text == "" ? doctor.doctorGraduate : graduate.text,
      'doctorDiscipline':
          discipline.text == "" ? doctor.doctorDiscipline : discipline.text,
      'doctorMastery1':
          mastery1.text == "" ? doctor.doctorMastery1 : mastery1.text,
      'doctorID': doctor.doctorID,
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
