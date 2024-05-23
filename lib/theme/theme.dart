import 'package:flutter/material.dart';

final theme = ThemeData(
    fontFamily: 'SF-Pro-Display',
    colorScheme: colorScheme,
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: colorScheme.surface),
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff0C0C0C),
        selectedItemColor: Color(0xff2261BC),
        unselectedItemColor: Color(0xff5E5F61),
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        type: BottomNavigationBarType.fixed));

const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff1D1E20),
    onPrimary: Colors.white,
    secondary: Color(0xff2F3035),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Color(0xff0c0c0c),
    onBackground: Colors.white,
    surface: Color(0xff242529),
    onSurface: Colors.white);
