import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_project/consts.dart';

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  TextTheme getTextTheme(Language language) {
    switch (language) {
      case Language.en:
        return enPrimaryTextTheme;
      case Language.fa:
        return faPrimaryTextTheme;
      default:
        return enPrimaryTextTheme;
    }
  }

  ThemeData getTheme(Language language) {
    // To share a Theme across the entire app
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      dividerTheme: const DividerThemeData(
        color: Colors.white10,
        indent: 32,
        thickness: 0.5,
      ),
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white10,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      textTheme: getTextTheme(language),
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(
        TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: primaryTextColor,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: primaryTextColor,
          ),
          bodyLarge: TextStyle(
            fontSize: 15,
            color: primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            color: secondaryTextColor,
          ),
        ),
      );

  TextTheme get faPrimaryTextTheme => TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: primaryTextColor,
          fontFamily: 'IranYekan',
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: primaryTextColor,
          fontFamily: 'IranYekan',
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: primaryTextColor,
          fontFamily: 'IranYekan',
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          height: 1.5,
          color: secondaryTextColor,
          fontFamily: 'IranYekan',
        ),
        bodySmall: const TextStyle(
          fontFamily: 'IranYekan',
        ),
        labelLarge: const TextStyle(
          fontFamily: 'IranYekan',
        ),
      );
}
