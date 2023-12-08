import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHUnderlinedButton extends StatelessWidget {
  const CHUnderlinedButton({required this.text, this.onPressed, super.key});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final buttonColor = _getButtonColor(
      isDarkMode: isDarkMode,
      isDisabled: isDisabled,
    );

    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(CHSpacing.sm),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: buttonColor,
            decoration: TextDecoration.underline,
            decorationColor: buttonColor,
          ),
        ),
      ),
    );
  }
}

Color _getButtonColor({
  required bool isDarkMode,
  required bool isDisabled,
}) {
  if (isDisabled) {
    return CHColors.grey;
  } else if (isDarkMode) {
    return CHColors.white;
  } else {
    return CHColors.black;
  }
}
