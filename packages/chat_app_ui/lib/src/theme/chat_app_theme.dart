import 'package:flutter/material.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/services.dart';

class CHTheme {
  /// Light Theme .
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CHColors.mediumViolet,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: CHColors.transparent,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      progressIndicatorTheme: _progressIndicatorLightTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      dividerColor: CHColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CHColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: CHColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: CHColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
        progressIndicatorTheme: _progressIndicatorDarkTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: CHColors.mediumViolet,
      primaryContainer: CHColors.lilac,
      onPrimaryContainer: CHColors.deeperViolet,
      secondary: CHColors.paleSky,
      onSecondary: CHColors.white,
      secondaryContainer: CHColors.lilac,
      onSecondaryContainer: CHColors.deeperViolet,
      tertiary: CHColors.richViolet,
      onTertiary: CHColors.white,
      tertiaryContainer: CHColors.lightLilac,
      onTertiaryContainer: CHColors.richViolet,
      error: CHColors.red,
      errorContainer: CHColors.red.shade200,
      onErrorContainer: CHColors.redWine,
      background: _backgroundColor,
      onBackground: CHColors.onBackground,
      surfaceVariant: CHColors.lightGrey,
      onSurfaceVariant: CHColors.grey,
      inversePrimary: CHColors.veryLightLilac,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: CHColors.black,
        onBackground: CHColors.white,
        surface: CHColors.black,
        onSurface: CHColors.lightGrey,
        primary: CHColors.lilac,
        onPrimary: CHColors.black,
        primaryContainer: CHColors.lilac,
        onPrimaryContainer: CHColors.black,
        secondary: CHColors.paleSky,
        onSecondary: CHColors.lightGrey,
        secondaryContainer: CHColors.liver,
        onSecondaryContainer: CHColors.brightGrey,
        surfaceVariant: CHColors.grey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => CHColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: CHColors.white,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      shape: const Border(
        bottom: BorderSide(color: CHColors.brightGrey, width: 1),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: CHColors.black,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: CHColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: CHColors.white,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: CHColors.white,
      displayColor: CHColors.white,
      decorationColor: CHColors.white,
    );
  }

  /// The UI text theme based on [CHTextStyle].
  static final lightUITextTheme = TextTheme(
    titleLarge: CHTextStyle.display1,
    displayLarge: CHTextStyle.displayLarge,
    displayMedium: CHTextStyle.displayMedium,
    displaySmall: CHTextStyle.displaySmall,
    headlineLarge: CHTextStyle.headlineLarge,
    headlineMedium: CHTextStyle.headlineMedium,
    headlineSmall: CHTextStyle.headlineSmall,
    titleMedium: CHTextStyle.titleMedium,
    titleSmall: CHTextStyle.titleSmall,
    bodyLarge: CHTextStyle.bodyLarge,
    bodyMedium: CHTextStyle.bodyMedium,
    bodySmall: CHTextStyle.bodySmall,
    labelLarge: CHTextStyle.labelLarge,
    labelMedium: CHTextStyle.labelMedium,
    labelSmall: CHTextStyle.labelSmall,
  ).apply(
    bodyColor: CHColors.black,
    displayColor: CHColors.black,
    decorationColor: CHColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: CHColors.white,
      disabledColor: _backgroundColor,
      selectedColor: CHColors.lilac,
      secondarySelectedColor: CHColors.richViolet,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: CHTextStyle.labelMedium.copyWith(color: CHColors.black),
      secondaryLabelStyle:
          CHTextStyle.labelSmall.copyWith(color: CHColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _darkChipTheme {
    return _chipTheme.copyWith(
      backgroundColor: CHColors.white,
      disabledColor: _backgroundColor,
      secondaryLabelStyle: CHTextStyle.labelSmall.copyWith(
        color: CHColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: CHColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CHSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: CHSpacing.lg),
      buttonColor: CHColors.lilac,
      disabledColor: CHColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: CHFontWeight.light,
        ),
        foregroundColor: CHColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: CHFontWeight.light,
        ),
        foregroundColor: CHColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: CHColors.surface,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CHSpacing.lg),
          topRight: Radius.circular(CHSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: CHColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: CHColors.onBackground,
      contentPadding: EdgeInsets.all(CHSpacing.lg),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorLightTheme {
    return const ProgressIndicatorThemeData(
      color: CHColors.darkViolet,
      circularTrackColor: CHColors.borderOutline,
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on dark theme.
  ProgressIndicatorThemeData get _progressIndicatorDarkTheme {
    return const ProgressIndicatorThemeData(
      color: CHColors.lightLilac,
      circularTrackColor: CHColors.white,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: CHTextStyle.labelMedium,
      labelColor: CHColors.lilac,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: CHSpacing.lg,
        vertical: CHSpacing.md + CHSpacing.xxs,
      ),
      unselectedLabelStyle: CHTextStyle.labelMedium,
      unselectedLabelColor: CHColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: CHColors.darkViolet,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: CHColors.black,
      selectedItemColor: CHColors.white,
      unselectedItemColor: CHColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => CHColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: CHSpacing.xlg,
            vertical: CHSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? CHTextStyle.labelMedium.copyWith(
                  color: CHColors.black,
                  fontWeight: FontWeight.w500,
                )
              : CHTextStyle.labelMedium.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? CHColors.black
                      : CHColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => CHColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: CHColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: CHSpacing.xlg,
            vertical: CHSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? CHTextStyle.labelMedium.copyWith(
                  color: CHColors.white,
                  fontWeight: FontWeight.w500,
                )
              : CHTextStyle.labelMedium.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? CHColors.black
                      : CHColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
