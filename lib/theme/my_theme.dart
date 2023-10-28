import 'package:flutter/material.dart';
import 'package:new_project/util/device.dart';

ThemeData myCustomTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      )
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.indigo,
    shadowColor: Colors.white12,
    shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(12.0),
    ),
  ),
  textTheme:   const TextTheme(
    bodySmall: TextStyle(
      color: Colors.amber,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.blue,
      fontSize: 25,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.blue,
      fontSize:22,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lobster',
    ),
  ),

);

ThemeData myCustomTheme2 = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.green,
  ),
  primaryColor: Colors.green,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.green,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  ),
);
