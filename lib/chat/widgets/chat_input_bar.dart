import 'dart:typed_data';

import 'package:chat_app/chat/chat.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

class ChatInputBar extends StatelessWidget {
  ChatInputBar({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  void _pickAndSendImage(
    BuildContext context,
    ImageSource source,
  ) {
    context.read<ChatBloc>().add(
          PhotoMessageAdded(source: source),
        );
  }

  @override
  Widget build(BuildContext context) {
    final stateImage = context.select(
      (ChatBloc bloc) => bloc.state.image,
    );
    final status = context.select(
      (ChatBloc bloc) => bloc.state.status,
    );
    return Container(
      padding: const EdgeInsets.all(CHSpacing.md),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera, color: CHColors.richViolet),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (_) => SelectMediaFromBottomSheet(
                  pickPictureFrom: (source) {
                    _pickAndSendImage(context, source);
                  },
                ),
              );
            },
          ),
          if (stateImage != null && !status.isMessageSent)
            Expanded(
              child: _ImageField(image: stateImage),
            )
          else
            Expanded(
              child: CHTextField(
                controller: _textEditingController,
                hintText: 'Type a message',
              ),
            ),
          if (status.isLoading)
            const CHCircularProgressIndicator()
          else
            _SendMessageButton(
              textEditingController: _textEditingController,
              image: stateImage,
            ),
        ],
      ),
    );
  }
}

class _SendMessageButton extends StatelessWidget {
  const _SendMessageButton({
    required TextEditingController textEditingController,
    required this.image,
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

class _ImageField extends StatelessWidget {
  const _ImageField({
    required this.image,
  });

  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return ImageContainer(image: image, color: CHColors.brightGrey);
    } else {
      return const SizedBox.shrink();
    }
  }
}
