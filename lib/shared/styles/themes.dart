import 'package:first_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Color(0xFF333739), //add0xFF before the hex code
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Color(0xFF333739),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFF333739),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Color(0xFF333739),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
  ),
  fontFamily: 'Janna',
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.blueGrey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Janna',
);