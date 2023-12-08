import 'package:equatable/equatable.dart';

/// {@template chat_exception}
/// Base class for all `ChatRepository` failures.
/// {@endtemplate}
abstract class ChatException extends Equatable implements Exception {
  /// {@macro chat_exception}
  const ChatException({
    required this.error,
    required this.stackTrace,
  });

  /// The underlying error.
  final Object error;

  /// The stack trace.
  final StackTrace stackTrace;

  @override
  List<Object> get props => [error, stackTrace];
}

/// {@template read_messages_exception}
/// Thrown when an exception occurs while reading messages.
/// {@endtemplate}
class ReadMessagesException extends ChatException {
  /// {@macro read_messages_exception}
  const ReadMessagesException(
    Object error,
    StackTrace stackTrace,
  ) : super(
          error: error,
          stackTrace: stackTrace,
        );
}

/// {@template save_messages_exception}
/// Thrown when an exception occurs while saving messages.
/// {@endtemplate}
class SaveMessagesException extends ChatException {
  /// {@macro save_messages_exception}
  const SaveMessagesException(
    Object error,
    StackTrace stackTrace,
  ) : super(
          error: error,
          stackTrace: stackTrace,
        );
}
