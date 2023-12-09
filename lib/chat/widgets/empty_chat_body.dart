import 'package:chat_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyChatBody extends StatelessWidget {
  const EmptyChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.noMessagesText,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
