import 'package:flutter/material.dart';
import 'package:money/presentation/tool/palatte.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Palette.primary,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
  inputDecorationTheme: inputDecorationTheme,
  filledButtonTheme: filledButtonTheme,
);

final filledButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    fixedSize: Size.fromHeight(48),
  ),
);

InputDecorationTheme inputDecorationTheme = const InputDecorationTheme(
  filled: true,
  border: OutlineInputBorder(),
);
