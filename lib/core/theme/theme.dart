import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  var colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    // brightness: Brightness.dark,
  );
  return ThemeData(
    colorScheme: colorScheme,
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
    dataTableTheme: DataTableThemeData(
      headingRowColor: WidgetStatePropertyAll(
        colorScheme.primary.withAlpha(10),
      ),
      headingRowHeight: 40,
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary.withAlpha(50)),
      ),
    ),
  );
}
