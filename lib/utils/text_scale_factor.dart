import 'package:flutter/material.dart';

double getTextScaleFactor({
  required BuildContext context,
  required double dataTextFactorLimit,
}) {
  final dataTextFactor = MediaQuery.textScaleFactorOf(context);
  return dataTextFactor > dataTextFactorLimit
      ? dataTextFactorLimit
      : dataTextFactor;
}
