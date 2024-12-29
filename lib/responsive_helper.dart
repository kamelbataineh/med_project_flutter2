import 'package:flutter/material.dart';

class ResponsiveHelper {
  static int getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width.toInt();
  }

  static int getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height.toInt();
  }

  static bool isMobile(BuildContext context) {
    int w = getWidth(context);
    int h = getHeight(context);
    return w <= 500 && h > 200 && h <= 800;
  }

  static bool isTablet(BuildContext context) {
    int w = getWidth(context);
    int h = getHeight(context);
    return (w > 500 && w <= 800) || (h > 800 && h <= 1200);
  }

  static bool isWeb(BuildContext context) {
    int w = getWidth(context);
    int h = getHeight(context);
    return w > 800 || h > 1200;
  }
}
