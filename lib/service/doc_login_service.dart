// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/doctor_model.dart';

class Doc_login_service {
  final String baseurl = "http://192.168.1.101:8080";
  final dio = Dio();

  Future<DoctorDataModel?> doc_login_call(
      {required String email, required int pass}) async {
    Map<String, dynamic> json = {"doctorMail": email, "doctorPassword": pass};
    var response = await dio.post("$baseurl/logdoc", data: json);
    if (response.statusCode == 200) {
      // ignore: prefer_typing_uninitialized_variables
      var result;
      if (response.data == "") {
        return result;
      }
      result = DoctorDataModel.fromJson(response.data);
      log("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
