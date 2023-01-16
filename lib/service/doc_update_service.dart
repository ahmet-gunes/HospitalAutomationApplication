import 'package:dio/dio.dart';
import 'package:doktorhasta/config/baseurl.dart';

// ignore: camel_case_types
class doc_update_service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  // ignore: non_constant_identifier_names
  Future<bool?> doc_update_call({required Map<String, dynamic> json}) async {
    var response = await dio.patch("$baseurl/doctor", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
