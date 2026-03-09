import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../model/message_model.dart';

class MessageProvider extends ChangeNotifier {
  MessageProvider() {
    loadMessages();
  }

  List<MessageModel> messages = [];

  void sendMessage(MessageModel message) {
    messages.add(message);
    notifyListeners();
  }

  void loadMessages() {
    messages = [
      MessageModel(message: "Hello 👋", time: '10:55 AM', isMe: true),
      MessageModel(message: "Hi! How are you?", time: '10:56 AM', isMe: false),
      MessageModel(
        message: "I'm good. Need service details.",
        time: '10:57 AM',
        isMe: true,
      ),
      MessageModel(
        message: "Sure! What service do you need?",
        time: '10:58 AM',
        isMe: false,
      ),
    ];
  }
  
}

final messageProvider = ChangeNotifierProvider<MessageProvider>(
  (ref) => MessageProvider(),
);
