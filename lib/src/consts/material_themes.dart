import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  final baseTheme = ThemeData.dark();
  return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackgroundColor: Color(0xFF000000),
      primaryColor: Color(0xFFFFFFFF),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFFE0E0E0),
        secondary: Color(0xFFFF8400),
        tertiary: Color(0xFF404040),
        shadow: Color(0xF5C5C5C),
        outline: Color(0xE6FF8400),
        errorContainer: Color(0xFFFF0000),
      ));
}

