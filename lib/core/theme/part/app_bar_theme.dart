import 'package:flutter/material.dart';

class MyAppBarTheme{
  static const lightAppBarTheme = AppBarTheme(
    centerTitle: true,
  );
  static const darkAppBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white),
  );
}