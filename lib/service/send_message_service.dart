import 'package:dio/dio.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/config/baseurl.dart';

class SendMessageService {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<bool?> message_send_call({required MessageModel message}) async {
    Map<String, dynamic> json = message.toJson();
    var response = await dio.post("$baseurl/message", data: json);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
