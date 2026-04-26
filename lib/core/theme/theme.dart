import 'package:flutter/material.dart';
import 'part/app_bar_theme.dart';

class AppTheme {
  static final lightAppTheme = ThemeData(
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  static final darkAppTheme = ThemeData(
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),

    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );
}
