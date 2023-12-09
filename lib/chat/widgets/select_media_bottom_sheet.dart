import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectMediaFromBottomSheet extends StatelessWidget {
  const SelectMediaFromBottomSheet({
    required this.pickPictureFrom,
    super.key,
  });

  final void Function(ImageSource source) pickPictureFrom;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CHSpacing.md),
      child: ListView(
        shrinkWrap: true,
        children: [
          BottomSheetTile(
            onTap: () {
              pickPictureFrom(
                ImageSource.camera,
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.camera_alt),
            text: l10n.uploadPictureFromCamera,
          ),
          const Divider(),
          BottomSheetTile(
            onTap: () {
              pickPictureFrom(
                ImageSource.gallery,
              );
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.photo_album_outlined),
            text: l10n.uploadPictureFromGallery,
          ),
        ],
      ),
    );
  }
}
