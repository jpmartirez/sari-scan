import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF1A5C38);
  static const Color lightGreen = Color(0xFF2E7D52);
  static const Color accentGreen = Color(0xFF4CAF7D);
  static const Color scannerGreen = Color(0xFF00C853);
  static const Color bgLight = Color(0xFFF0FAF5);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFE0F7F0);
  static const Color textDark = Color(0xFF0D2B1E);
  static const Color textMid = Color(0xFF3A6B52);
  static const Color textLight = Color(0xFF7AAF94);
  static const Color lowStockRed = Color(0xFFE53935);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: accentGreen,
        background: bgLight,
        surface: bgWhite,
      ),
      scaffoldBackgroundColor: bgLight,
      textTheme: GoogleFonts.dmSansTextTheme().copyWith(
        displayLarge: GoogleFonts.dmSerifDisplay(
          color: textDark,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.dmSans(
          color: textDark,
          fontWeight: FontWeight.w800,
          fontSize: 26,
        ),
        titleLarge: GoogleFonts.dmSans(
          color: textDark,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        bodyMedium: GoogleFonts.dmSans(
          color: textDark,
          fontSize: 14,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bgWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.dmSans(
          color: primaryGreen,
          fontWeight: FontWeight.w800,
          fontSize: 22,
          letterSpacing: -0.5,
        ),
        iconTheme: const IconThemeData(color: primaryGreen),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryGreen, width: 2),
        ),
        labelStyle: GoogleFonts.dmSans(
          color: textMid,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 1.0,
        ),
        hintStyle: GoogleFonts.dmSans(color: textLight),
      ),
    );
  }
}
