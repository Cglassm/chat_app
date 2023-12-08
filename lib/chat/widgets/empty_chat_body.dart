import 'package:flutter/material.dart';

class EmptyChatBody extends StatelessWidget {
  const EmptyChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No messages yet start chatting now!',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
