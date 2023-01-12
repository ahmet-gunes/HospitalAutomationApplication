import 'package:dio/dio.dart';

class pat_register_service {
  final String baseurl = "http://192.168.1.104:8080";
  final dio = Dio();

  Future<bool?> pat_register_call({required Map<String, dynamic> json}) async {
    var response = await dio.post("$baseurl/patient", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
