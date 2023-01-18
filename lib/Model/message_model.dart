class MessageModel {
  final int senderID;
  final int recieverID;
  final String senderName;
  final String message;
  final String? media;

  MessageModel(this.senderID, this.recieverID, this.senderName, this.message,
      this.media);
  MessageModel.fromJson(Map<String, dynamic> json)
      : senderID = json["messageSender"],
        recieverID = json["messageReciever"],
        senderName = json["SenderName"],
        message = json["messageText"],
        media = json["messageMedia"];

  Map<String, dynamic> toJson() => {
        "messageSender": senderID,
        "messageReciever": recieverID,
        "SenderName": senderName,
        "messageText": message,
        "messageMedia": media,
      };
}
