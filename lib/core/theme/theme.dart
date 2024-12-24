import 'package:flutter/material.dart';

var theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 20),
      ),
      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16)),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    width: 500,
  ),
  appBarTheme: AppBarTheme(
    elevation: 1,
  ),
  navigationDrawerTheme: NavigationDrawerThemeData(
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  searchBarTheme: SearchBarThemeData(
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
