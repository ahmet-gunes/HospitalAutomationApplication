import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/doctor_model.dart';

class doc_login_service {
  final String baseurl = "http://192.168.1.104:8080";
  final dio = Dio();

  Future<doctorDataModel?> doc_login_call(
      {required String email, required int pass}) async {
    Map<String, dynamic> json = {"doctorMail": email, "doctorPassword": pass};
    var response = await dio.post("$baseurl/logdoc", data: json);
    if (response.statusCode == 200) {
      var result = doctorDataModel.fromJson(response.data);
      log("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
