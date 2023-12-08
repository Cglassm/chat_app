import 'package:chat_app/app/app.dart';
import 'package:chat_app/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_picker/media_picker.dart';

void main() {
  group('App', () {
    testWidgets('renders ChatPage', (tester) async {
      await tester.pumpWidget(
        App(
          mediaPicker: MediaPicker(),
          chatRepository: ChatRepository(),
        ),
      );
      expect(find.byType(ChatPage), findsOneWidget);
    });

    testWidgets('renders ChatInputBar', (tester) async {
      await tester.pumpWidget(
        App(
          mediaPicker: MediaPicker(),
          chatRepository: ChatRepository(),
        ),
      );
      expect(find.byType(ChatInputBar), findsOneWidget);
    });
  });
}
