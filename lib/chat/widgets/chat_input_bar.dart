import 'package:chat_app/chat/chat.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputBar extends StatelessWidget {
  ChatInputBar({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CHSpacing.md),
      child: Row(
        children: [
          Expanded(
            child: CHTextField(
              controller: _textEditingController,
              hintText: 'Type a message',
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: CHColors.richViolet),
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                context.read<ChatBloc>().add(
                      SendMessage(_textEditingController.text),
                    );
                _textEditingController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
