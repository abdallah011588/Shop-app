
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor: Colors.black26,
  primarySwatch: Colors.lightBlue,
  appBarTheme: AppBarTheme(
    titleSpacing: 10.0,
    backgroundColor:Colors.black26,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.black26,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    button: TextStyle(
      color: Colors.red,
    ),
    bodyText2: TextStyle(
      color: Colors.green,
    ),

    subtitle2: TextStyle(
      color: Colors.white,
    ),

  ),
);





ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.lightBlue,
  appBarTheme: AppBarTheme(
    titleSpacing: 10.0,
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    backgroundColor: Colors.white,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);

