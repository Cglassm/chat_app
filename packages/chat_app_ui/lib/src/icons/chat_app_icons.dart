import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_app_ui/src/generated/assets.gen.dart';

abstract class CHIcon {
  /// Returns the back icon with an optional size and color.
  SvgPicture backIcon({double? size, Color? color}) {
    return SvgPicture.asset(
      Assets.icons.backIcon.path,
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }

  /// Returns the email outline icon with an optional size and color.
  SvgPicture emailOutline({double? size, Color? color}) {
    return SvgPicture.asset(
      Assets.icons.emailOutline.path,
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }
}
