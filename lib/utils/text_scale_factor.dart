import 'package:flutter/material.dart';

/// Returns the text scale factor of the [BuildContext] if it is less than
/// [dataTextFactorLimit], otherwise returns [dataTextFactorLimit].
double getTextScaleFactor({
  required BuildContext context,
  required double dataTextFactorLimit,
}) {
  final dataTextFactor = MediaQuery.textScaleFactorOf(context);
  return dataTextFactor > dataTextFactorLimit
      ? dataTextFactorLimit
      : dataTextFactor;
}
