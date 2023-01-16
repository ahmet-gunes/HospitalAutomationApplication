import 'package:dio/dio.dart';
import '../Model/message_model.dart';
import '../config/baseurl.dart';

class Chat_Update_service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<List<MessageModel>> message_update_call(
      {required int sender, required int reciever}) async {
    var response = await dio.get("$baseurl:8080/messages", queryParameters: {
      "messageSender": sender,
      "messageReciever": reciever
    });
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
