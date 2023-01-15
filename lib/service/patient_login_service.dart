import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/patient_model.dart';

// ignore: camel_case_types
class Pat_Login_Service {
  final String baseurl = "http://192.168.1.2:8080";
  final dio = Dio();

  // ignore: non_constant_identifier_names
  Future<PatientDataModel?> pat_login_call(
      {required String email, required int pass}) async {
    Map<String, dynamic> json = {"PatientMail": email, "PatientPassword": pass};
    var response = await dio.post("$baseurl/logpat", data: json);
    if (response.statusCode == 200) {
      // ignore: prefer_typing_uninitialized_variables
      var result;
      if (response.data == "") {
        return result;
      }
      result = PatientDataModel.fromJson(response.data);
      log("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
