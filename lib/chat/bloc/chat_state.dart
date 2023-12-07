part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  loading,
  loaded,
  error,
}

final class ChatState extends Equatable {
  const ChatState({
    required this.status,
    required this.messages,
    this.message,
  });

  ChatState.initial()
      : this(
          status: ChatStatus.initial,
          messages: [],
        );

  final ChatStatus status;
  final List<ChatMessage> messages;
  final String? message;

  ChatState copyWith({
    ChatStatus? status,
    List<ChatMessage>? messages,
    String? message,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        message,
      ];
}
