import 'dart:typed_data';

import 'package:chat_app/chat/chat.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageIconButton extends StatelessWidget {
  const SendMessageIconButton({
    required TextEditingController textEditingController,
    required this.image,
    super.key,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.send, color: CHColors.richViolet),
      onPressed: () {
        if (_textEditingController.text.isNotEmpty) {
          context.read<ChatBloc>().add(
                SendMessage(message: _textEditingController.text),
              );
          _textEditingController.clear();
        }
        if (image != null) {
          context.read<ChatBloc>().add(
                const SendMessage(message: ''),
              );
        }
      },
    );
  }
}
