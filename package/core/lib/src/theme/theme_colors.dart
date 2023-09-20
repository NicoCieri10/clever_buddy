import 'package:flutter/material.dart';

/// Custom theme colors
abstract class ThemeColors {
  /// Custom primary color
  static const primary = Colors.amber;

  /// Custom primary color dark
  static const primaryDark = Color.fromARGB(255, 128, 97, 5);

  /// Custom red color
  static const red = Color(0xffD32F2F);

  /// Custom blue color
  static const blue = Color(0xff1976D2);

  /// Custom yellow color
  static const yellow = Color(0xffFBC02D);
}

/// Custom theme
class AppTheme {
  /// Custom theme constructor
  const AppTheme(this.selectedColor);

  /// Custom theme selected color
  final Color selectedColor;

  /// Custom theme data
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: selectedColor,
    );
  }
}
