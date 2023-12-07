import 'package:chat_app/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(
        mediaPicker: context.read<MediaPicker>(),
      )..add(const ChatStarted()),
      child: const ChatView(),
    );
  }
}
