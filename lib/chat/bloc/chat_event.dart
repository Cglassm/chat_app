part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class SendMessageEvent extends ChatEvent {
  const SendMessageEvent(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class ChatStarted extends ChatEvent {
  const ChatStarted();
}

class MessageSent extends ChatEvent {
  const MessageSent({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class PhotoMessageAdded extends ChatEvent {
  const PhotoMessageAdded({required this.source});
  final ImageSource source;

  @override
  List<Object?> get props => [source];
}

class MessageDeleted extends ChatEvent {
  const MessageDeleted({required this.messageId});
  final String messageId;

  @override
  List<Object?> get props => [messageId];
}

class ClearImage extends ChatEvent {
  const ClearImage();
}
