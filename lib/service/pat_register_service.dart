import 'package:dio/dio.dart';

// ignore: camel_case_types
class pat_register_service {
  final String baseurl = "http://192.168.1.2:8080";
  final dio = Dio();

  // ignore: non_constant_identifier_names
  Future<bool?> pat_register_call({required Map<String, dynamic> json}) async {
    var response = await dio.post("$baseurl/patient", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
