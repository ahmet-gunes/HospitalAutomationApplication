import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:doktorhasta/config/baseurl.dart';
import 'package:doktorhasta/Model/doctor_model.dart';

class get_doc_service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<DoctorDataModel> get_doc_call({required int id}) async {
    Map<String, dynamic> json = {"doctorID": id};
    var response = await dio.post("$baseurl/doctor/id", data: json);
    if (response.statusCode == 200) {
      return DoctorDataModel.fromJson(response.data);
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
