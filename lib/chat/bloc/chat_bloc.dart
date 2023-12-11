import 'dart:async';

import 'package:chat_app/utils/utils.dart';
import 'package:chat_repository/chat_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';
import 'package:uuid/uuid.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required MediaPicker mediaPicker,
    required ChatRepository chatRepository,
  })  : _mediaPicker = mediaPicker,
        _chatRepository = chatRepository,
        super(ChatState.initial()) {
    on<ChatStarted>(_onChatStarted);
    on<MessageSent>(_onMessageSent);
    on<PhotoMessageAdded>(_onPhotoMessageAdded);
    on<MessageDeleted>(_onMessageDeleted);
    on<ClearImage>(_onClearImage);
  }

  final MediaPicker _mediaPicker;
  final ChatRepository _chatRepository;

  Future<void> _onChatStarted(
    ChatStarted event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: ChatStatus.loadingMessages));
    await Future<void>.delayed(const Duration(seconds: 2));
    try {
      final messages = await _chatRepository.readMessages();
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

  Future<void> _onMessageSent(
    MessageSent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(status: ChatStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 2));

    final newMessages = List<ChatMessage>.from(state.messages);
    const uuid = Uuid();
    final userMessageId = uuid.v4();
    final botResponseId = uuid.v4();
    final currentTime = DateTime.now();

    newMessages.add(
      ChatMessage(
        message: state.image != null ? '' : event.message,
        image: state.image,
        dateTime: currentTime,
        isUser: true,
        id: userMessageId,
      ),
    );

    final botResponse = getBotResponse(event.message);
    newMessages.add(
      ChatMessage(
        message: botResponse,
        dateTime: currentTime,
        isUser: false,
        id: botResponseId,
      ),
    );

    try {
      await _chatRepository.saveMessages(newMessages);

      emit(
        state.copyWith(
          status: ChatStatus.messageSent,
          messages: newMessages,
          resetImage: state.image != null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ChatStatus.error));
    }
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

  Future<void> _onMessageDeleted(
    MessageDeleted event,
    Emitter<ChatState> emit,
  ) async {
    try {
      await _chatRepository.deleteMessage(event.messageId);
      final updatedMessages =
          state.messages.where((m) => m.id != event.messageId).toList();
      emit(
        state.copyWith(
          status: ChatStatus.messageDeleted,
          messages: updatedMessages,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ChatStatus.error));
    }
  }

  Future<void> _onClearImage(
    ClearImage event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(resetImage: state.image != null));
  }
}
