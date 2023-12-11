import 'package:chat_app/utils/utils.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';

class MessageDateTime extends StatelessWidget {
  const MessageDateTime({
    required this.chatMessage,
    required this.theme,
    super.key,
  });

  final ChatMessage chatMessage;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      getFormattedDate(
        chatMessage.dateTime,
      ),
      style: theme.textTheme.bodySmall
          ?.copyWith(color: theme.colorScheme.background),
      textScaleFactor: getTextScaleFactor(
        context: context,
        dataTextFactorLimit: 2,
      ),
    );
  }
}
