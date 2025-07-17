// // ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double kDefLeftRight = 16;
double kDefTopBottom = 10;

enum ThemeType { dark, light, defaults }

ThemeData? themeDefaults;

Map<ThemeType, ThemeData?> sadasborTheme = {
  ThemeType.dark: themeDark,
  ThemeType.light: themeLight,
  ThemeType.defaults: themeDefaults,
};

final ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF0077D5),
  scaffoldBackgroundColor: const Color(0xFFF8F9FB),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    elevation: 0,
    titleSpacing: 20,
    centerTitle: false,
  ),
  colorScheme: const ColorScheme(
    // primary: Color(0xFF0077D5),
    primary:  Color(0xFFFFF0BB),
    primaryContainer: Color(0xFF042f62),
    secondary: Color(0xFFFFB800),
    secondaryContainer: Color(0xFFFFF6D5),
    // secondaryContainer: Color(0xFFFFF0BB),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF8F9FB),
    error: Color(0xFFD32F2F),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFF484848),
    onBackground: Color(0xFF484848),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.firaSans(
        color: const Color(0xFF484848), fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.firaSans(
        color: const Color(0xFF484848), fontSize: 16, fontWeight: FontWeight.w700),
    bodyMedium: GoogleFonts.firaSans(
        color: const Color(0xFF484848), fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF484848)),
);

final ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF0077D5),
  scaffoldBackgroundColor: const Color(0xFF1B1B1D),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2C2C2E),
    elevation: 0,
    titleSpacing: 20,
    centerTitle: false,
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xFF0077D5),
    primaryContainer: Color(0xFF042f62),
    secondary: Color(0xFFFFB800),
    secondaryContainer: Color(0xFF2C2C2E),
    surface: Color(0xFF2C2C2E),
    background: Color(0xFF1B1B1D),
    error: Color(0xFFD32F2F),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onError: Color(0xFF000000),
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.firaSans(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.firaSans(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    bodyMedium: GoogleFonts.firaSans(
        color: Colors.white, fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);