import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData.light().copyWith(
  primaryColor: lMainColor,
  scaffoldBackgroundColor: lBackgroundColor,
  backgroundColor: lBackgroundColor,
  iconTheme: const IconThemeData(color: lSubColor),
  colorScheme: const ColorScheme.light(
    primary: lMainColor,
    secondary: lSubColor,
    error: kErrorColor,
  ),
  cardColor: lSubColor,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: lBackgroundColor,
      foregroundColor: lMainColor),
  drawerTheme: const DrawerThemeData(backgroundColor: lBackgroundColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: lBackgroundColor, backgroundColor: lMainColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lBackgroundColor,
    selectedItemColor: lSubColor,
    selectedIconTheme: IconThemeData(color: lSubColor),
    showUnselectedLabels: true,
  ),
);

final ThemeData darkThemeData = ThemeData.dark().copyWith(
  primaryColor: dMainColor,
  scaffoldBackgroundColor: dBackgroundColor,
  backgroundColor: dBackgroundColor,
  iconTheme: const IconThemeData(color: dSubColor),
  colorScheme: const ColorScheme.light(
    primary: dMainColor,
    secondary: dSubColor,
    error: kErrorColor,
  ),
  cardColor: dSubColor,
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: dBackgroundColor,
      foregroundColor: dMainColor),
  drawerTheme: const DrawerThemeData(backgroundColor: dBackgroundColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: dBackgroundColor, backgroundColor: dMainColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: dBackgroundColor,
    selectedItemColor: dAccentColor,
    selectedIconTheme: IconThemeData(color: dAccentColor),
    showUnselectedLabels: true,
  ),
);

const lMainColor = Color(0xFF006064);
const lSubColor = Color(0xFF4DD0E1);
const lBackgroundColor = Color(0xFFE0E0E0);

const dMainColor = Color(0xFF60CAAD);
const dSubColor = Color(0xFF9DA5A0);
const dAccentColor = Color(0xFFE9E9E9);
const dBackgroundColor = Color(0xFF333333);

const kErrorColor = Color(0xFFFF0000);
