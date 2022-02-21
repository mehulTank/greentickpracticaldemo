import 'package:flutter/material.dart';



dynamic getSize(double px,BuildContext context) {
  return px *
      ((MathUtilities.screenWidth(context)) / 375);
}

dynamic getFontSize(double px,BuildContext context) {
  return px *
      (MathUtilities.screenWidth(context) / 375);
}

dynamic getPercentageWidth(double percentage,BuildContext context) {
  return MathUtilities.screenWidth(context) *
      percentage /
      100;
}

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static screenWidthDensity(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}
