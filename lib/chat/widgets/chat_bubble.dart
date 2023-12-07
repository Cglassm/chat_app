import 'package:chat_app/chat/chat_messsage.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.chatMessage,
    super.key,
  });
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = chatMessage.isUser;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CHSpacing.md,
        vertical: CHSpacing.sm,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: CHSpacing.xs,
        horizontal: CHSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isUser ? theme.colorScheme.primary : theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(CHSpacing.lg),
      ),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            chatMessage.message,
            style: theme.textTheme.bodyMedium?.copyWith(color: CHColors.white),
          ),
          Text(
            getFormattedDate(
              chatMessage.dateTime,
            ),
            style: theme.textTheme.bodySmall?.copyWith(color: CHColors.white),
          ),
        ],
      ),
    );
  }
}
