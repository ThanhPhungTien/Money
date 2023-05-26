import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: lightColorScheme,
  listTileTheme: listTileThemeData,
  useMaterial3: true,
);

ListTileThemeData listTileThemeData = const ListTileThemeData(
    // iconColor: Colors.black,
    );

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.robotoFlex(
    fontSize: 51,
  ),
  displayMedium: GoogleFonts.robotoFlex(
    fontSize: 45,
  ),
  displaySmall: GoogleFonts.robotoFlex(
    fontSize: 40,
  ),
  headlineLarge: GoogleFonts.robotoFlex(
    fontSize: 36,
  ),
  headlineMedium: GoogleFonts.robotoFlex(
    fontSize: 32,
  ),
  headlineSmall: GoogleFonts.robotoFlex(
    fontSize: 28,
  ),
  titleLarge: GoogleFonts.robotoFlex(
    fontSize: 25,
  ),
  titleMedium: GoogleFonts.robotoFlex(
    fontSize: 22,
  ),
  titleSmall: GoogleFonts.robotoFlex(
    fontSize: 20,
  ),
  labelLarge: GoogleFonts.robotoFlex(
    fontSize: 18,
  ),
  labelMedium: GoogleFonts.robotoFlex(
    fontSize: 16,
    height: 20 / 16,
  ),
  labelSmall: GoogleFonts.robotoFlex(
    fontSize: 14,
    height: 20 / 14,
  ),
  bodyLarge: GoogleFonts.robotoFlex(
    fontSize: 16,
  ),
  bodyMedium: GoogleFonts.robotoFlex(
    fontSize: 11,
  ),
  bodySmall: GoogleFonts.robotoFlex(
    fontSize: 10,
  ),
);
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006D39),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF9AF6B3),
  onPrimaryContainer: Color(0xFF00210D),
  secondary: Color(0xFF4858A9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDEE1FF),
  onSecondaryContainer: Color(0xFF00115A),
  tertiary: Color(0xFF3A646F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBEEAF6),
  onTertiaryContainer: Color(0xFF001F26),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFDF7),
  onBackground: Color(0xFF191C19),
  surface: Color(0xFFFBFDF7),
  onSurface: Color(0xFF191C19),
  surfaceVariant: Color(0xFFDDE5DB),
  onSurfaceVariant: Color(0xFF414941),
  outline: Color(0xFF717971),
  onInverseSurface: Color(0xFFF0F1EC),
  inverseSurface: Color(0xFF2E312E),
  inversePrimary: Color(0xFF7FDA99),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006D39),
  outlineVariant: Color(0xFFC1C9BF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7FDA99),
  onPrimary: Color(0xFF00391B),
  primaryContainer: Color(0xFF00522A),
  onPrimaryContainer: Color(0xFF9AF6B3),
  secondary: Color(0xFFBAC3FF),
  onSecondary: Color(0xFF152778),
  secondaryContainer: Color(0xFF304090),
  onSecondaryContainer: Color(0xFFDEE1FF),
  tertiary: Color(0xFFA2CED9),
  onTertiary: Color(0xFF01363F),
  tertiaryContainer: Color(0xFF204D56),
  onTertiaryContainer: Color(0xFFBEEAF6),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C19),
  onBackground: Color(0xFFE1E3DE),
  surface: Color(0xFF191C19),
  onSurface: Color(0xFFE1E3DE),
  surfaceVariant: Color(0xFF414941),
  onSurfaceVariant: Color(0xFFC1C9BF),
  outline: Color(0xFF8B938A),
  onInverseSurface: Color(0xFF191C19),
  inverseSurface: Color(0xFFE1E3DE),
  inversePrimary: Color(0xFF006D39),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF7FDA99),
  outlineVariant: Color(0xFF414941),
  scrim: Color(0xFF000000),
);
