import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class CustomThemeData {
  static ThemeData darkTheme() {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: const Color(0xFFFFFFFF),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFE0E0E0),
          secondary: const Color(0xFFFF8400),
          tertiary: const Color(0xFF404040),
          shadow: const Color(0x0f5c5c5c),
          outline: const Color(0xE6FF8400),
          errorContainer: const Color(0xFFFF0000),
        ));
  }
}
