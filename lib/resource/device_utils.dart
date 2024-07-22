// device_utils.dart
import 'package:flutter/material.dart';

class DeviceUtils {
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = (size.width * size.width + size.height * size.height).toDouble();
    final isTablet = diagonal > 1100.0; // A threshold to determine tablet
    return isTablet;
  }

  static bool isMobile(BuildContext context) {
    return !isTablet(context);
  }
}
