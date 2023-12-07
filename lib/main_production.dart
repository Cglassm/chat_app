import 'package:chat_app/app/app.dart';
import 'package:chat_app/bootstrap.dart';
import 'package:media_picker/media_picker.dart';

void main() {
  bootstrap(
    () => App(
      mediaPicker: MediaPicker(),
    ),
  );
}
