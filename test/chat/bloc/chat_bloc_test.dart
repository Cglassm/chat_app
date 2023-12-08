import 'package:bloc_test/bloc_test.dart';
import 'package:chat_app/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_picker/media_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockMediaPicker extends Mock implements MediaPicker {}

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  group('ChatBloc', () {
    late MediaPicker mediaPicker;
    late ChatRepository chatRepository;

    setUp(() {
      mediaPicker = MockMediaPicker();
      chatRepository = MockChatRepository();
    });

    test('initial state is ChatState.initial()', () {
      expect(
        ChatBloc(mediaPicker: mediaPicker, chatRepository: chatRepository)
            .state,
        equals(ChatState.initial()),
      );
    });

    blocTest<ChatBloc, ChatState>(
      'emits new state when SendMessage is called',
      build: () =>
          ChatBloc(mediaPicker: mediaPicker, chatRepository: chatRepository),
      act: (bloc) => bloc.add(const SendMessage(message: 'Hello')),
      expect: () => [isA<ChatState>()],
    );
  });
}
