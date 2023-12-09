import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final l10n = context.l10n;

    return GestureDetector(
      onLongPress: () {
        showDeleteDialog<void>(
          context,
          onTapDelete: () => context
              .read<ChatBloc>()
              .add(MessageDeleted(messageId: chatMessage.id)),
          title: l10n.deleteConfirmationDialogTitle,
          description: l10n.deleteConfirmationDialogDescription,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(CHSpacing.md),
        margin: const EdgeInsets.symmetric(
          vertical: CHSpacing.xs,
          horizontal: CHSpacing.sm,
        ),
        decoration: BoxDecoration(
          color:
              isUser ? theme.colorScheme.primary : theme.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(CHSpacing.lg),
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (chatMessage.image != null)
              ImageContainer(
                image: chatMessage.image,
              )
            else
              Text(
                chatMessage.message,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.background),
                textScaleFactor: getTextScaleFactor(
                  context: context,
                  dataTextFactorLimit: 2,
                ),
              ),
            _MessageDateTime(chatMessage: chatMessage, theme: theme),
          ],
        ),
      ),
    );
  }
}

class _MessageDateTime extends StatelessWidget {
  const _MessageDateTime({
    required this.chatMessage,
    required this.theme,
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
