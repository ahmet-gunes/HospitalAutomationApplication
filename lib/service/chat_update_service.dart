import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/message_model.dart';
import '../config/baseurl.dart';

class Chat_Update_service {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<List<MessageModel>> message_update_call(
      {required int sender, required int reciever}) async {
    var response = await dio.post("$baseurl/messages",
        data: {"messageSender": sender, "messageReciever": reciever});
    if (response.statusCode == 200) {
      List<MessageModel>? MessageList = [];

      MessageList = (response.data as List)
          .map((e) => MessageModel.fromJson(e))
          .cast<MessageModel>()
          .toList();
      return MessageList;
    } else {
      throw ("Bir Sorun Oluştu ${response.statusCode}");
    }
  }
}
