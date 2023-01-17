import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/message_model.dart';
import '../config/baseurl.dart';

class Message_Chat_List {
  final String baseurl = BaseurlConstants().baseurl;
  final dio = Dio();

  Future<List<MessageModel>> message_update_call({required int sender}) async {
    var response = await dio
        .post("$baseurl/messages/chats", data: {"messageSender": sender});
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
