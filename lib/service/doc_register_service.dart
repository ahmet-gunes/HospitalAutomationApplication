import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/doctor_model.dart';

class doc_register_service {
  final String baseurl = "http://192.168.1.104:8080";
  final dio = Dio();

  Future<bool?> doc_register_call({required Map<String, dynamic> json}) async {
    var response = await dio.post("$baseurl/doctor", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
