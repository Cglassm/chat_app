import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class BottomSheetTile extends StatelessWidget {
  const BottomSheetTile({
    required this.onTap,
    required this.text,
    required this.icon,
    this.textStyle,
    super.key,
  });

  final VoidCallback onTap;
  final String text;
  final Widget icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CHSpacing.xs),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            const SizedBox(width: CHSpacing.s20),
            icon,
            const SizedBox(width: CHSpacing.md),
            Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
