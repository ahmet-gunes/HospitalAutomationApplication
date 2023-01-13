import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/service/doc_register_service.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:grock/grock.dart';

class DocRegisterRiverpod extends ChangeNotifier {
  final service = doc_register_service();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController mastery1 = TextEditingController();
  TextEditingController mastery2 = TextEditingController();
  TextEditingController mastery3 = TextEditingController();
  TextEditingController discipline = TextEditingController();
  TextEditingController graduate = TextEditingController();
  TextEditingController workplace = TextEditingController();

  void fetch() {
    loadingPopup();
    if (name.text != "" &&
        email.text != "" &&
        pass.text != "" &&
        discipline.text != "" &&
        mastery1.text != "" &&
        gender.text != "" &&
        graduate.text != "" &&
        workplace.text != "") {
      service.doc_register_call(json: {
        'doctorName': name.text,
        'doctorMail': email.text,
        'doctorPassword': int.parse(pass.text),
        'doctorPhoto': null,
        'doctorGender': gender.text,
        'doctorDiscipline': discipline.text,
        'doctorMastery1': mastery1.text,
        'doctorMastery2': mastery2.text,
        'doctorMastery3': mastery3.text,
        'doctorGraduate': graduate.text,
        'doctorWorkplace': workplace.text,
        'doctorOnline': 0
      }).then((value) {
        if (value == true) {
          Grock.back();
          Grock.toRemove(const HomePage());
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
