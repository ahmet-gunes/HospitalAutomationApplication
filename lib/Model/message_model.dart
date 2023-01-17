class MessageModel {
  final int senderID;
  final int recieverID;
  final String senderName;
  final String message;
  final String? media;
  final String date;
  MessageModel(this.senderID, this.recieverID, this.senderName, this.message,
      this.media, this.date);
  MessageModel.fromJson(Map<String, dynamic> json)
      : senderID = json["messageSender"],
        recieverID = json["messageReciever"],
        senderName = json["SenderName"],
        message = json["messageText"],
        media = json["messageMedia"],
        date = json["messageDate"];

  Map<String, dynamic> toJson() => {
        "messageSender": senderID,
        "messageReciever": recieverID,
        "SenderName": senderName,
        "messageText": message,
        "messageMedia": media,
        "messageDate": date,
      };
}
