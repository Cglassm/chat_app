import 'dart:convert';
import 'dart:typed_data';

/// A class representing a message of the chat.
///
/// Contains all necessary information for a message, including
/// the content of the message, the date and time it was sent, whether the message
/// was sent by the user or someone else, and an optional image.
class ChatMessage {
  /// Constructor for `ChatMessage`.
  ///
  /// Requires the parameters [message], [dateTime], and [isUser].
  /// The parameter [image] is optional.
  ChatMessage({
    required this.message,
    required this.dateTime,
    required this.isUser,
    this.image,
  });

  /// The content of the message.
  final String message;

  /// The date and time the message was sent.
  final DateTime dateTime;

  /// A boolean indicating whether the message was sent by the user.
  final bool isUser;

  /// An optional image associated with the message, represented as `Uint8List`.
  final Uint8List? image;

  /// Converts a `ChatMessage` to a map for serialization.
  ///
  /// Uses `toIso8601String` to convert the date and time to a format
  /// that can be easily serialized and deserialized.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'dateTime': dateTime.toIso8601String(),
      'isUser': isUser,
      'image': image?.base64,
    };
  }

  /// Creates a `ChatMessage` from a map.
  ///
  /// Uses `DateTime.parse` to convert the date and time from a serialized format
  /// to a `DateTime` object.
  static ChatMessage fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      message: json['message'],
      dateTime: DateTime.parse(json['dateTime']),
      isUser: json['isUser'],
      image: json['image'] == null ? null : base64.decode(json['image']),
    );
  }
}

/// Extension for `Uint8List` that adds the ability to convert
/// binary data to a Base64 string.
///
/// This is useful for the serialization of images.
extension on Uint8List {
  /// Gets the Base64 representation of the binary data.
  String get base64 => base64Encode(this);
}
