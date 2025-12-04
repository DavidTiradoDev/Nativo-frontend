import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF4CAF50);
  static const Color secondary = Color(0xFFFFC107);

  static const Color background = Color(0xFFF9FAFB);

  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF6C757D);

  static const Color border = Color(0xFFE0E0E0);

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);

  static const Color inputFill = Color(0xFFF1F3F4);

  static const double fontTitleLarge = 26;
  static const double fontTitleMedium = 20;
  static const double fontSubtitle = 16;
  static const double fontBody = 14;
  static const double fontSmall = 12;
  static const double fontButton = 16;

  static const TextStyle titleLarge = TextStyle(
    fontSize: fontTitleLarge,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: fontTitleMedium,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: fontSubtitle,
    fontWeight: FontWeight.w500,
    color: textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: fontBody,
    fontWeight: FontWeight.normal,
    color: textPrimary,
  );

  static const TextStyle small = TextStyle(
    fontSize: fontSmall,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: fontButton,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;

  static const double radius = 12;
}
