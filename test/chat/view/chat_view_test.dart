import 'package:bloc_test/bloc_test.dart';
import 'package:chat_app/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatBloc extends MockBloc<ChatEvent, ChatState> implements ChatBloc {}

void main() {
  group('ChatView', () {
    late ChatBloc chatBloc;

    setUp(() {
      chatBloc = MockChatBloc();
    });

    testWidgets('renders ChatBubble when there is one message', (tester) async {
      when(() => chatBloc.state).thenReturn(
        ChatState(
          messages: [
            ChatMessage(
              message: 'Hello',
              dateTime: DateTime.now(),
              isUser: true,
            ),
          ],
          status: ChatStatus.loaded,
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: chatBloc,
            child: const ChatView(),
          ),
        ),
      );
      expect(find.byType(ChatBubble), findsOneWidget);
    });

    testWidgets('renders empty state when there are no messages',
        (tester) async {
      when(() => chatBloc.state)
          .thenReturn(const ChatState(messages: [], status: ChatStatus.loaded));
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: chatBloc,
            child: const ChatView(),
          ),
        ),
      );
      expect(find.byType(EmptyChatBody), findsOneWidget);
    });
  });
}
