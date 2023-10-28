import 'package:flutter/material.dart';

final ThemeData custom_theme = ThemeData(
  primarySwatch: Colors.indigo,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple

    ),
    bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.indigo),
  ),
);