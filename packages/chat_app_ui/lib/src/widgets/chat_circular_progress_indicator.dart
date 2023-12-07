import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHCircularProgressIndicator extends StatelessWidget {
  const CHCircularProgressIndicator({
    super.key,
    this.size = CHSpacing.xlg,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(CHSpacing.md),
      child: const CircularProgressIndicator(),
    );
  }
}
