import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0D9488); // River Teal
  static const Color secondaryColor = Color(0xFF0284C7); // Ocean Blue
  static const Color tertiaryColor = Color(0xFFF97316); // Sunset Orange
  static const Color backgroundColor = Color(0xFFF7F9FB);
  static const Color surfaceColor = Colors.white;
  static const Color onSurfaceColor = Color(0xFF191C1E);
  static const Color onSurfaceVariantColor = Color(0xFF3D4947);
  static const Color outlineColor = Color(0xFF6D7A77);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        surface: backgroundColor,
        onSurface: onSurfaceColor,
        tertiary: tertiaryColor,
        error: Colors.red,
        onSurfaceVariant: onSurfaceVariantColor,
        outline: outlineColor,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 36,
          color: onSurfaceColor,
        ),
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: onSurfaceColor,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurfaceColor,
        ),
        bodyLarge: GoogleFonts.beVietnamPro(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: onSurfaceColor,
        ),
        bodySmall: GoogleFonts.beVietnamPro(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: onSurfaceVariantColor,
        ),
        labelLarge: GoogleFonts.beVietnamPro(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.05 * 12,
          color: outlineColor,
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24), // rounded-xl
        ),
        elevation: 2,
        color: surfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // rounded-lg
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
