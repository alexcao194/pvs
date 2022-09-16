import 'package:flutter/material.dart';



class AppTheme {
  static get theme => ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white
      ),
      bodyMedium: TextStyle(
        color: Colors.white54,
        fontWeight: FontWeight.w600
      )
    )
  );
}