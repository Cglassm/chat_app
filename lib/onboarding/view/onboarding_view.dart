import 'package:chat_app/app/app.dart';
import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CHOutlinedButton.secondary(
                  text: 'Start chatting',
                  onPressed: () {
                    context.push(ChatPage.path);
                  },
                ),
                CHUnderlinedButton(
                  onPressed: () {
                    launchURL(kTermsAndConditionsUrl);
                  },
                  text: 'terms & conditions',
                  textColor: CHColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
