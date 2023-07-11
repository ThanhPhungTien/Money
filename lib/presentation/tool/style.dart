import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: lightColorScheme,
  listTileTheme: listTileThemeData,
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF286C2A),
      foregroundColor: Colors.white,
    ),
  ),
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
  primary: Color(0xFF286C2A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFABF5A3),
  onPrimaryContainer: Color(0xFF002203),
  secondary: Color(0xFF53634F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD6E8CE),
  onSecondaryContainer: Color(0xFF111F0F),
  tertiary: Color(0xFF38656A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBCEBF0),
  onTertiaryContainer: Color(0xFF002023),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C19),
  surface: Color(0xFFFCFDF6),
  onSurface: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFDEE5D8),
  onSurfaceVariant: Color(0xFF424940),
  outline: Color(0xFF72796F),
  onInverseSurface: Color(0xFFF1F1EB),
  inverseSurface: Color(0xFF2F312D),
  inversePrimary: Color(0xFF90D889),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF286C2A),
  outlineVariant: Color(0xFFC2C9BD),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF90D889),
  onPrimary: Color(0xFF003909),
  primaryContainer: Color(0xFF085314),
  onPrimaryContainer: Color(0xFFABF5A3),
  secondary: Color(0xFFBACCB3),
  onSecondary: Color(0xFF253423),
  secondaryContainer: Color(0xFF3B4B38),
  onSecondaryContainer: Color(0xFFD6E8CE),
  tertiary: Color(0xFFA0CFD4),
  onTertiary: Color(0xFF00363B),
  tertiaryContainer: Color(0xFF1E4D52),
  onTertiaryContainer: Color(0xFFBCEBF0),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1C19),
  onBackground: Color(0xFFE2E3DD),
  surface: Color(0xFF1A1C19),
  onSurface: Color(0xFFE2E3DD),
  surfaceVariant: Color(0xFF424940),
  onSurfaceVariant: Color(0xFFC2C9BD),
  outline: Color(0xFF8C9388),
  onInverseSurface: Color(0xFF1A1C19),
  inverseSurface: Color(0xFFE2E3DD),
  inversePrimary: Color(0xFF286C2A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF90D889),
  outlineVariant: Color(0xFF424940),
  scrim: Color(0xFF000000),
);
