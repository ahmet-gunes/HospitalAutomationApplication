import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/patient_model.dart';

import 'package:doktorhasta/config/baseurl.dart';
import 'package:doktorhasta/Model/doctor_model.dart';

class get_pat_service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<PatientDataModel> get_pat_call({required int id}) async {
    Map<String, dynamic> json = {"patientID": id};
    var response = await dio.post("$baseurl/patient/id", data: json);
    if (response.statusCode == 200) {
      return PatientDataModel.fromJson(response.data);
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
