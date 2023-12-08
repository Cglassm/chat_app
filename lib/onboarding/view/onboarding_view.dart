import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: CHColors.red,
      body: Column(
        children: [
          CHOutlinedButton.secondary(
            text: 'Start chatting',
            borderColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onBackground,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
