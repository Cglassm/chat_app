import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.image,
    this.color = CHColors.transparent,
  });

  final Uint8List? image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CHSpacing.sm),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(CHSpacing.lg),
      ),
      child: Image.memory(
        image!,
        width: CHSpacing.s150,
        height: CHSpacing.s150,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
