import 'package:flutter/services.dart';

class ChatMessage {
  ChatMessage({
    required this.message,
    required this.dateTime,
    required this.isUser,
    this.image,
  });
  final String message;
  final DateTime dateTime;
  final bool isUser;
  final Uint8List? image;
}
