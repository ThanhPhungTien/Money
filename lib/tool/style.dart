import 'package:flutter/material.dart';

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

TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(
    color: Colors.black,
    fontSize: 51,
  ),
  displayMedium: TextStyle(
    color: Colors.black,
    fontSize: 45,
  ),
  displaySmall: TextStyle(
    color: Colors.black,
    fontSize: 40,
  ),
  headlineLarge: TextStyle(
    color: Colors.black,
    fontSize: 36,
  ),
  headlineMedium: TextStyle(
    color: Colors.black,
    fontSize: 32,
  ),
  headlineSmall: TextStyle(
    color: Colors.black,
    fontSize: 28,
  ),
  titleLarge: TextStyle(
    color: Colors.black,
    fontSize: 25,
  ),
  titleMedium: TextStyle(
    color: Colors.black,
    fontSize: 22,
  ),
  titleSmall: TextStyle(
    color: Colors.black,
    fontSize: 20,
  ),
  labelLarge: TextStyle(
    color: Colors.black,
    fontSize: 18,
  ),
  labelMedium: TextStyle(
    color: Colors.black,
    fontSize: 16,
    height: 20 / 16,
  ),
  labelSmall: TextStyle(
    color: Colors.black,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodyLarge: TextStyle(
    color: Colors.black,
    fontSize: 12,
  ),
  bodyMedium: TextStyle(
    color: Colors.black,
    fontSize: 11,
  ),
  bodySmall: TextStyle(
    color: Colors.black,
    fontSize: 10,
  ),
);
