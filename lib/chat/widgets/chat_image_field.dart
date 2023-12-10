import 'dart:typed_data';

import 'package:chat_app/chat/chat.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatImageField extends StatelessWidget {
  const ChatImageField({
    required this.image,
    super.key,
  });

  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          ImageContainer(image: image, color: CHColors.brightGrey),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.read<ChatBloc>().add(const ClearImage());
            },
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
