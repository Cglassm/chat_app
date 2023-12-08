import 'package:chat_app/app/app.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:media_picker/media_picker.dart';

Future<App> mainCommon() async {
  final mediaPicker = MediaPicker();
  final chatRepository = ChatRepository();
  return App(
    mediaPicker: mediaPicker,
    chatRepository: chatRepository,
  );
}
