import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: OnboardingPage.path,
      routes: [
        GoRoute(
          path: OnboardingPage.path,
          name: OnboardingPage.path,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: ChatPage.path,
          name: ChatPage.path,
          builder: (context, state) => const ChatPage(),
        ),
      ],
    );
  }
}
