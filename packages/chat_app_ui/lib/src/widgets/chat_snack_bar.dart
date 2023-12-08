import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';

class CHSnackBar extends SnackBar {
  CHSnackBar.success({
    Key? key,
    required String text,
    EdgeInsetsGeometry? padding,
    double? elevation,
    VoidCallback? onVisible,
    double? width,
    double? bottomSpacing,
    int? duration,
  }) : super(
          key: key,
          content: Text(
            text,
            style: CHTextStyle.labelSmall.copyWith(color: CHColors.black),
          ),
          duration: Duration(seconds: duration ?? 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CHColors.success,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CHSpacing.s10),
            side: const BorderSide(
              color: CHColors.black,
            ),
          ),
          padding: padding,
          elevation: elevation,
          width: width,
          onVisible: onVisible,
          margin: const EdgeInsets.symmetric(
            horizontal: CHSpacing.xlg,
          ),
        );

  CHSnackBar.error({
    Key? key,
    required String text,
    EdgeInsetsGeometry? padding,
    double? elevation,
    VoidCallback? onVisible,
    double? width,
    double? bottomSpacing,
    int? duration,
  }) : super(
          key: key,
          content: Text(
            text,
            style: CHTextStyle.labelLarge.copyWith(
              color: CHColors.black,
              fontWeight: CHFontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: duration ?? 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CHColors.lightRedWine,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CHSpacing.s10),
            side: const BorderSide(
              color: CHColors.black,
            ),
          ),
          padding: padding,
          elevation: elevation,
          width: width,
          onVisible: onVisible,
          margin: const EdgeInsets.only(
            left: CHSpacing.xlg,
            right: CHSpacing.xlg,
            bottom: CHSpacing.xlg,
          ),
        );
}
