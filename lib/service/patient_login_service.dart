import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/patient_model.dart';

class pat_login_service {
  final String baseurl = "http://192.168.1.104:8080";
  final dio = Dio();

  Future<patientDataModel?> pat_login_call(
      {required String email, required int pass}) async {
    Map<String, dynamic> json = {"PatientMail": email, "PatientPassword": pass};
    var response = await dio.post("$baseurl/logpat", data: json);
    if (response.statusCode == 200) {
      var result;
      if (response.data == "") {
        return result;
      }
      result = patientDataModel.fromJson(response.data);
      log("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
