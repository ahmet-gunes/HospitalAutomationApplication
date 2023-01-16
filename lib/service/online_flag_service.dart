import 'package:dio/dio.dart';
import 'package:doktorhasta/config/baseurl.dart';

class Online_Flag_Service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<bool?> online_status_call({required Map<String, dynamic> json}) async {
    var response = await dio.patch("$baseurl/doctor/online", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
