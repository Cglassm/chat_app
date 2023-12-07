import 'dart:async';

import 'package:chat_app/chat/chat_messsage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required MediaPicker mediaPicker})
      : _mediaPicker = mediaPicker,
        super(ChatState.initial()) {
    on<ChatStarted>(_onChatStarted);
    on<SendMessage>(_onSendMessage);
    on<PhotoMessageAdded>(_onPhotoMessageAdded);
  }

  final MediaPicker _mediaPicker;

  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    // if (event is SendMessageEvent) {
    //   _messages.add(event.message);
    //   yield ChatMessagesUpdatedState(List.from(_messages));
    // }
  }

  Future<void> _onChatStarted(
    ChatStarted event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: ChatStatus.loading));
    try {
      final messages = <ChatMessage>[];
      // final messages = await _chatRepository.getMessages();
      emit(
        state.copyWith(
          status: ChatStatus.loaded,
          messages: messages,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ChatStatus.error));
    }
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: ChatStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 3));
    final newMessages = List<ChatMessage>.from(state.messages);

    if (state.image != null) {
      newMessages.add(
        ChatMessage(
          message: '',
          image: state.image,
          dateTime: DateTime.now(),
          isUser: true,
        ),
      );
    } else {
      newMessages.add(
        ChatMessage(
          message: event.message,
          dateTime: DateTime.now(),
          isUser: true,
        ),
      );
    }

    newMessages.add(
      ChatMessage(
        message: 'Recibí tu mensaje',
        dateTime: DateTime.now(),
        isUser: false,
      ),
    );

    emit(state.copyWith(status: ChatStatus.messageSent, messages: newMessages));
  }

  Future<void> _onPhotoMessageAdded(
    PhotoMessageAdded event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final image = await _mediaPicker.pickImage(
        source: event.source,
      );
      if (image == null) return;
      emit(
        state.copyWith(
          image: image,
          status: ChatStatus.loaded,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ChatStatus.error));
    }
  }
}
