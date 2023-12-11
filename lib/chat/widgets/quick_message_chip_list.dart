import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickMessageChipsList extends StatelessWidget {
  QuickMessageChipsList({super.key});

  final List<String> quickMessages = [
    'Hello',
    'Thank you!',
    'See you later!',
    'Good morning',
    'Good afternoon',
    'What are your functions?',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: CHSpacing.s44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: CHSpacing.s),
        itemCount: quickMessages.length,
        itemBuilder: (_, int index) {
          final message = quickMessages[index];
          return CHChip(
            onTap: () {
              context.read<ChatBloc>().add(MessageSent(message: message));
            },
            margin: const EdgeInsets.only(top: CHSpacing.s),
            child: Text(
              message,
              style: theme.textTheme.labelLarge,
              textScaleFactor: getTextScaleFactor(
                context: context,
                dataTextFactorLimit: 1.2,
              ),
            ),
          );
        },
      ),
    );
  }
}
