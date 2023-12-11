import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct CHIcon based on the current theme
  CHIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return CHIconsDark();
    } else {
      return CHIconsLight();
    }
  }
}
