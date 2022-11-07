import 'package:flutter/material.dart';

class AppThemes {
  AppThemes();

  //constants color range for light theme
  static const Color _lightPrimaryColor = Colors.green;
  static const Color _lightFloatingActionButtonColor = Colors.green;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightOnPrimaryColor = Color(0xff7c7e8e);
  static const Color _lightOnTextButtonColor = Colors.lightBlue;

  //text theme for light theme
  static final TextStyle _lightScreenHeadLine5TextStyle =
      TextStyle(color: _lightPrimaryVariantColor);
  static final TextStyle _lightScreenBody1TextStyle =
      TextStyle(color: _lightOnPrimaryColor);
  static final TextStyle _lightScreenHeadLine4TextStyle =
      TextStyle(color: _lightPrimaryVariantColor);
  static final TextStyle _lightButtonTextStyle = TextStyle(
      color: _lightPrimaryVariantColor,
      fontSize: 14,
      fontWeight: FontWeight.bold);
  static final TextStyle _lightTextButtonTextStyle = TextStyle(
      decoration: TextDecoration.underline,
      color: _lightOnTextButtonColor,
      fontSize: 14,
      fontWeight: FontWeight.w500);

  static final TextTheme _lightTextTheme = TextTheme(
    headline5: _lightScreenHeadLine5TextStyle,
    headline4: _lightScreenHeadLine4TextStyle,
    bodyText1: _lightScreenBody1TextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _lightPrimaryColor,
      iconTheme: const IconThemeData(color: _lightPrimaryVariantColor),
      toolbarTextStyle: _lightTextTheme.bodyText2,
      titleTextStyle: _lightTextTheme.headline6,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: _lightPrimaryColor, textStyle: _lightButtonTextStyle),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: _lightPrimaryColor,
        side: const BorderSide(color: _lightPrimaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: _lightOnTextButtonColor,
            textStyle: _lightTextButtonTextStyle)),
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    textTheme: _lightTextTheme,
  );
}
