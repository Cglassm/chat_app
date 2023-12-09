import 'package:chat_app/app/app.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: CHColors.lilacVioletGradient,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                CHOutlinedButton.secondary(
                  text: 'Start chatting',
                  borderColor: theme.colorScheme.primary,
                  textColor: theme.colorScheme.onBackground,
                  onPressed: () {},
                ),
                CHUnderlinedButton(
                  onPressed: () {
                    launchURL(kTermsAndConditionsUrl);
                  },
                  text: 'terms & conditions',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
