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

class SendMessage extends ChatEvent {
  const SendMessage({required this.message});
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
