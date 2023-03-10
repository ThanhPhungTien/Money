import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
    background: Colors.grey,
  ),
  listTileTheme: listTileThemeData,

);

ListTileThemeData listTileThemeData = const ListTileThemeData(
  iconColor: Colors.black,
);

TextTheme textTheme =  TextTheme(
  displayLarge: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 51,

  ),
  displayMedium: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 45,
  ),
  displaySmall: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 40,
  ),
  headlineLarge: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 36,
  ),
  headlineMedium: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 32,
  ),
  headlineSmall: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 28,
  ),
  titleLarge: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 25,
  ),
  titleMedium: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 22,
  ),
  titleSmall: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 20,
  ),
  labelLarge: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 18,
  ),
  labelMedium: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 16,
    height: 20 / 16,
  ),
  labelSmall: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodyLarge: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 12,
  ),
  bodyMedium: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 11,
  ),
  bodySmall: GoogleFonts.robotoFlex(
    color: Colors.black,
    fontSize: 10,
  ),
);
