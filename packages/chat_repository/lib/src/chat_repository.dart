import 'dart:convert';
import 'dart:io';
import 'package:chat_repository/chat_repository.dart';
import 'package:path_provider/path_provider.dart';

/// {@template chat_repository}
/// A repository that handles saving and retrieving chat messages from
/// local storage.
///
/// Utilizes the `path_provider` package to find the correct local path
/// and stores the chat messages in a JSON file.
/// {@endtemplate}
class ChatRepository {
  /// The name of the file where chat messages will be stored.
  static const String _fileName = 'chat_app.json';

  /// Retrieves the local path where the chat messages file is stored.
  ///
  /// Uses the `getApplicationDocumentsDirectory` method from the
  /// `path_provider` package to get the directory.
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print("Directory path is ${directory.path}");
    return directory.path;
  }

  /// Retrieves the file used to store chat messages.
  ///
  /// Returns a `File` object representing the chat messages file.
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  /// Saves a list of [ChatMessage]s to local storage.
  ///
  /// Serializes the [ChatMessage]s to JSON and writes them to the file.
  /// Throws [SaveMessagesException] if an error occurs.
  Future<void> saveMessages(List<ChatMessage> messages) async {
    try {
      final file = await _localFile;
      final messagesList = messages.map((m) => m.toJson()).toList();
      final messagesJson = jsonEncode(messagesList);
      await file.writeAsString(messagesJson);
    } catch (e, s) {
      throw SaveMessagesException(e, s);
    }
  }

  /// Reads and returns a list of [ChatMessage]s from local storage.
  ///
  /// Deserializes JSON data from the file into [ChatMessage] objects.
  /// If the file does not exist, it creates a new file with an empty list.
  /// Throws [ReadMessagesException] if an error occurs.
  Future<List<ChatMessage>> readMessages() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) {
        await file.writeAsString(jsonEncode([]));
        return [];
      }
      final contents = await file.readAsString();
      final List<dynamic> messagesList = jsonDecode(contents);
      return messagesList.map((m) => ChatMessage.fromJson(m)).toList();
    } catch (e, s) {
      throw ReadMessagesException(e, s);
    }
  }

  /// Deletes a message from local storage.
  ///
  /// Reads the messages from the file, filters the messages to remove the message
  Future<void> deleteMessage(String messageId) async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> messagesList = jsonDecode(contents);

      final updatedMessagesList =
          messagesList.where((message) => message['id'] != messageId).toList();

      final messagesJson = jsonEncode(updatedMessagesList);
      await file.writeAsString(messagesJson);
    } catch (e, s) {
      throw DeleteMessageException(e, s);
    }
  }
}
