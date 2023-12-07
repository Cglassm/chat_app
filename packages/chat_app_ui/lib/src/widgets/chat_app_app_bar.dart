import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_app_bar}
/// A custom app bar widget.
class CHAppBar extends AppBar {
  /// The AppBar if the user wants to add actions.
  CHAppBar.actionAppBar(
    Widget? title,
    ButtonStyle? buttonStyle, {
    super.key,
    super.titleTextStyle,
    super.leading,
    super.backgroundColor,
    super.centerTitle,
    super.leadingWidth,
    List<Widget>? actions,
  }) : super(
          toolbarHeight: _toolbarHeight,
          elevation: 2,
          actions: actions,
          automaticallyImplyLeading: false,
          title: title,
        );

  // The AppBar if the user wants to add actions.
  CHAppBar.textAppBar(
    String? textTitle, {
    super.key,
    super.titleTextStyle,
    super.leading,
    super.backgroundColor,
    super.centerTitle,
    super.leadingWidth,
    List<Widget>? actions,
  }) : super(
          toolbarHeight: _toolbarHeight,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: actions,
          title: Text(
            textTitle!,
            style: CHTextStyle.headlineLarge
                .copyWith(fontWeight: CHFontWeight.semiBold, fontSize: 20),
          ),
        );

  // The AppBar if the user wants to add actions.
  CHAppBar.backButton({
    String? textTitle,
    required VoidCallback onTapBackButton,
    List<Widget>? actions,
    super.key,
    super.titleTextStyle,
    super.backgroundColor,
    super.centerTitle,
    super.leadingWidth,
  }) : super(
          toolbarHeight: _toolbarHeight,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: onTapBackButton,
          ),
          actions: actions,
          title: textTitle != null
              ? Row(
                  children: [
                    Text(
                      textTitle,
                      style: CHTextStyle.displaySmall,
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              : null,
        );

  /// {@macro app_app_bar}
  CHAppBar({
    super.key,
    super.titleTextStyle,
    super.leading,
    super.backgroundColor,
    super.elevation,
    super.centerTitle,
    super.toolbarHeight,
    super.leadingWidth,
    super.actions,
    super.title,
    super.automaticallyImplyLeading,
    super.shape,
  });
  static const _toolbarHeight = kToolbarHeight;
}
