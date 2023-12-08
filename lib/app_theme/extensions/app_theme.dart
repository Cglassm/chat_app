import 'package:chat_app/app_theme/app_theme.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

extension AppThemeX on AppTheme {
  ThemeData get theme {
    if (isDarkMode) {
      return CHTheme().darkTheme;
    } else {
      return CHTheme().lightTheme;
    }
  }
}
