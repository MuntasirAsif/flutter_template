enum MessageType { normal, serviceOffer }

class MessageModel {
  final String message;
  final String time;
  final bool isMe;
  final MessageType messageType;
  MessageModel({
    required this.message,
    required this.time,
    required this.isMe,
    this.messageType = MessageType.normal,
  });
}
