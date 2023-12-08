import 'dart:typed_data';

import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class ChatImageField extends StatelessWidget {
  const ChatImageField({
    required this.image,
    super.key,
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
