import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.red,
      secondary: Colors.amber,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.black,
      secondary: Colors.grey,
    ),
    scaffoldBackgroundColor: Colors.black12,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
