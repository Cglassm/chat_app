import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

class ChatInputBar extends StatelessWidget {
  ChatInputBar({super.key});

  final TextEditingController _textEditingController = TextEditingController();

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
          const _ImageIconButton(),
          const _AudioIconButton(),
          if (stateImage != null && !status.isMessageSent)
            Expanded(
              child: ChatImageField(image: stateImage),
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
            SendMessageIconButton(
              textEditingController: _textEditingController,
              image: stateImage,
            ),
        ],
      ),
    );
  }
}

class _AudioIconButton extends StatelessWidget {
  const _AudioIconButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.mic,
        color: CHColors.richViolet,
      ),
      onPressed: () {
        // TODO(future): Implement voice message here
        ScaffoldMessenger.of(context).showSnackBar(
          CHSnackBar.error(
            text: context.l10n.voiceMessageNotImplemented,
          ),
        );
      },
    );
  }
}

class _ImageIconButton extends StatelessWidget {
  const _ImageIconButton();

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
    return IconButton(
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
    );
  }
}
