import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ── Brand Colors ──
  static const Color primaryRed = Color(0xFF9E1B22);
  static const Color darkRed = Color(0xFFB71C1C);
  static const Color white = Colors.white;
  static const Color textDark = Color(0xFF212121);
  static const Color textBody = Color(0xFF424242);
  static const Color bgLight = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE0E0E0);

  // ── Border Radius ──
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 20.0;
  static const double radiusCircle = 50.0;

  // ── Spacing ──
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 20.0;
  static const double spacingXL = 24.0;

  // ── ThemeData ──
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: primaryRed,
      scaffoldBackgroundColor: white,
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        elevation: 2,
        iconTheme: IconThemeData(color: textDark),
        titleTextStyle: TextStyle(
          color: textDark,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
          elevation: 0,
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.8,
          color: textBody,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textBody,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: white,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryRed,
        primary: primaryRed,
      ),
    );
  }

  // ── Reusable Decorations ──
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(radiusMedium),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      );

  static BoxDecoration get redBorderDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(radiusMedium),
        border: Border.all(color: primaryRed, width: 2),
      );
}
