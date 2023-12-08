part of 'chat_bloc.dart';

enum ChatStatus {
  initial,
  loading,
  loaded,
  error,
  messageSent,
  messageDeleted;

  bool get isInitial => this == ChatStatus.initial;
  bool get isLoading => this == ChatStatus.loading;
  bool get isLoaded => this == ChatStatus.loaded;
  bool get isError => this == ChatStatus.error;
  bool get isMessageSent => this == ChatStatus.messageSent;
  bool get isMessageDeleted => this == ChatStatus.messageDeleted;
}

final class ChatState extends Equatable {
  const ChatState({
    required this.status,
    required this.messages,
    this.image,
  });

  ChatState.initial()
      : this(
          status: ChatStatus.initial,
          messages: [],
        );

  final ChatStatus status;
  final List<ChatMessage> messages;
  final Uint8List? image;

  ChatState copyWith({
    ChatStatus? status,
    List<ChatMessage>? messages,
    Uint8List? image,
    bool resetImage = false,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      image: resetImage ? null : image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        image,
      ];
}
