import 'package:chat_app/app/app.dart';
import 'package:chat_app/app/router/router.dart';
import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/onboarding/view/onboarding_page.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_picker/media_picker.dart';

void main() {
  group('App', () {
    testWidgets('renders OnboardingPage', (tester) async {
      await tester.pumpWidget(
        App(
          mediaPicker: MediaPicker(),
          chatRepository: ChatRepository(),
          router: AppRouter.router(),
        ),
      );
      expect(find.byType(OnboardingPage), findsOneWidget);
    });
  });
}
