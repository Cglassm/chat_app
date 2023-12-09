import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHChip extends StatelessWidget {
  const CHChip({
    required this.child,
    required this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? const EdgeInsets.all(CHSpacing.sm),
        decoration: BoxDecoration(
          color:
              backgroundColor ?? (isDarkMode ? CHColors.black : CHColors.white),
          border: Border.all(
            color: borderColor ?? CHColors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? CHSpacing.s22),
          ),
        ),
        child: child,
      ),
    );
  }
}
