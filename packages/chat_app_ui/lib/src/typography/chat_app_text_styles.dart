import 'package:chat_app_ui/src/generated/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_ui/chat_app_ui.dart';

//extension for font weights

abstract class CHTextStyle {
  /// Base Text Style
  static const _baseTextStyle = TextStyle(
    package: 'chat_app_ui',
    fontWeight: CHFontWeight.regular,
    fontFamily: FontFamily.workSans,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display 1 Text Style
  static final TextStyle display1 = _baseTextStyle.copyWith(
    fontSize: 64,
    fontWeight: CHFontWeight.extraBold,
    height: 1.12,
    letterSpacing: -0.25,
  );

  /// Headline 1 Text Style
  static final TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: CHFontWeight.semiBold,
    height: 1.22,
  );

  /// Headline 2 Text Style
  static final TextStyle displayMedium = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: CHFontWeight.semiBold,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle displaySmall = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: CHFontWeight.semiBold,
    height: 1.28,
  );

  /// Headline 4 Text Style
  static final TextStyle headlineLarge = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: CHFontWeight.bold,
    height: 1.28,
  );

  /// Headline 5 Text Style
  static final TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: CHFontWeight.semiBold,
    height: 1.28,
  );

  /// Headline 6 Text Style
  static final TextStyle headlineSmall = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: CHFontWeight.bold,
    height: 1.28,
  );

  /// Subtitle 1 Text Style
  static final TextStyle titleMedium = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: CHFontWeight.medium,
    height: 1.5,
    letterSpacing: 0.1,
  );

  /// Subtitle 2 Text Style
  static final TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: CHFontWeight.medium,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyLarge = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: CHFontWeight.medium,
    letterSpacing: 0.5,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: CHFontWeight.medium,
    height: 1.42,
    letterSpacing: 0.25,
  );

  /// Label Text Style
  static final TextStyle labelLarge = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: CHFontWeight.medium,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Caption Text Style
  static final TextStyle labelMedium = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: CHFontWeight.medium,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Button Text Style
  static final TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: CHFontWeight.semiBold,
    height: 1.42,
    letterSpacing: 0.1,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 10,
    height: 1.33,
    letterSpacing: 0.5,
  );

  /// Placeholder Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: CHFontWeight.bold,
    height: 1.45,
    letterSpacing: 0.5,
  );
}
