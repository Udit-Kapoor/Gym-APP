import 'package:flutter/material.dart';

ThemeData themeData() => ThemeData(
    primarySwatch: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonBarTheme: ButtonBarThemeData(
      alignment: MainAxisAlignment.center,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ));
