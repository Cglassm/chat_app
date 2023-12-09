import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

Future<T?> showDeleteDialog<T>(
  BuildContext context, {
  required VoidCallback onTapDelete,
  required String title,
  required String description,
  String? deleteButtonText,
  bool barrierDismissible = false,
}) {
  final theme = Theme.of(context);
  final l10n = context.l10n;

  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) => CHDialog(
      title: title,
      icon: const Icon(Icons.delete_rounded, color: CHColors.black),
      hasCloseIcon: false,
      description: description,
      actions: [
        CHUnderlinedButton(
          text: l10n.cancelButtonText,
          textColor: CHColors.black,
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
        SizedBox(
          width: CHSpacing.s110,
          child: SizedBox(
            width: CHSpacing.s110,
            height: CHSpacing.s52,
            child: CHOutlinedButton(
              padding: const EdgeInsets.symmetric(
                horizontal: CHSpacing.s20,
                vertical: CHSpacing.sm,
              ),
              onPressed: () {
                onTapDelete();
                Navigator.pop(ctx);
              },
              text: l10n.deleteButtonText,
              textColor: CHColors.white,
              backgroundColor: CHColors.red,
              borderColor: CHColors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
