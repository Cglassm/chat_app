import 'dart:async';

import 'package:chat_app/chat/chat_messsage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<ChatStarted>(_onChatStarted);
    on<SendMessage>(_onSendMessage);
  }

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
    final newMessages = List<ChatMessage>.from(state.messages)
      ..add(
        ChatMessage(
          message: event.message,
          dateTime: DateTime.now(),
          isUser: true,
        ),
      )
      ..add(
        ChatMessage(
          message: 'Recibí tu mensaje',
          dateTime: DateTime.now(),
          isUser: false,
        ),
      );

    emit(
      state.copyWith(
        status: ChatStatus.loaded,
        messages: newMessages,
      ),
    );
  }
}
