class ChatMessage {
  ChatMessage({
    required this.message,
    required this.dateTime,
    required this.isUser,
  });
  final String message;
  final DateTime dateTime;

  /// true si es mensaje del usuario, false si es del bot
  final bool isUser;
}
