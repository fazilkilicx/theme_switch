import 'package:flutter/material.dart';


class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.cyan,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
    appBarTheme: const AppBarTheme(
      color: Colors.deepPurple,
    ),
  );
}
