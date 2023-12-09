import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHOutlinedButton extends StatelessWidget {
  const CHOutlinedButton({
    super.key,
    this.backgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
    this.size,
    this.padding,
  });

  /// Primary button which background color is the primary color of the theme
  const CHOutlinedButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.size,
    this.padding,
    this.backgroundColor = CHColors.black,
    this.textColor = CHColors.white,
  }) : borderColor = null;

  /// Secondary button which background color is the secondary color of the theme
  const CHOutlinedButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.size,
    this.padding,
    this.borderColor = CHColors.black,
    this.textColor = CHColors.black,
  }) : backgroundColor = CHColors.transparent;

  /// Secondary darck button which background color is the secondary color of the theme
  const CHOutlinedButton.secondaryDark({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.size,
    this.padding,
  })  : backgroundColor = CHColors.transparent,
        borderColor = CHColors.black,
        textColor = CHColors.black;

  /// Tertiary button which is only underlined
  const CHOutlinedButton.tertiary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.size,
    this.padding,
    this.textColor = CHColors.black,
  })  : backgroundColor = CHColors.transparent,
        borderColor = null;

  /// Text on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border color of the button
  final Color? borderColor;

  /// Icon on the button
  final Widget? icon;

  /// Size of the button
  final Size? size;

  /// Padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final isInactive = onPressed == null;
    final theme = Theme.of(context);
    final dataTextFactor = MediaQuery.textScaleFactorOf(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: padding,
        minimumSize: size ?? const Size(CHSpacing.s276, CHSpacing.xxxlg),
        shape: const StadiumBorder(),
        disabledBackgroundColor: CHColors.lightGrey,
        backgroundColor: backgroundColor,
        side: borderColor == null
            ? null
            : BorderSide(
                color: isInactive ? CHColors.transparent : borderColor!,
                width: CHSpacing.xs,
              ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          SizedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isInactive ? (theme.colorScheme.background) : textColor,
                fontWeight: FontWeight.w600,
              ),
              textScaleFactor: dataTextFactor > 1.2 ? 1.1 : dataTextFactor,
            ),
          ),
        ],
      ),
    );
  }
}
