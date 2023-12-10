import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHDialog extends StatelessWidget {
  const CHDialog({
    required this.title,
    this.actions = const [],
    this.content,
    this.icon,
    this.hasCloseIcon = true,
    this.description,
    this.backgroundColor,
    this.hasDivider = true,
    super.key,
    this.descriptionFontSize,
  });

  final String title;
  final List<Widget> actions;
  final Widget? content;
  final Widget? icon;
  final bool hasCloseIcon;
  final String? description;
  final Color? backgroundColor;
  final bool hasDivider;
  final double? descriptionFontSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        bottom: CHSpacing.xxlg,
      ),
      backgroundColor: backgroundColor ?? CHColors.veryLightLilac,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CHSpacing.xlg),
        side: const BorderSide(),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: actions,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasCloseIcon)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: CHSpacing.xlg,
                    width: CHSpacing.xlg,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CHColors.black,
                      ),
                      borderRadius: BorderRadius.circular(CHSpacing.xlg),
                      color: Colors.transparent,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close_rounded,
                        size: CHSpacing.lg,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: CHSpacing.lg),
            if (icon != null) ...[
              icon!,
              const SizedBox(height: CHSpacing.lg),
            ],
            Text(
              title,
              style: textTheme.displaySmall?.copyWith(color: CHColors.black),
            ),
            const SizedBox(height: CHSpacing.lg),
            if (description != null) ...[
              Text(
                description!,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: descriptionFontSize ?? CHSpacing.lg,
                  color: CHColors.black,
                ),
              ),
              const SizedBox(height: CHSpacing.xlg),
            ],
            if (content != null) content!,
            if (hasDivider)
              Container(
                height: 1,
                color: CHColors.black,
              ),
          ],
        ),
      ),
    );
  }
}
