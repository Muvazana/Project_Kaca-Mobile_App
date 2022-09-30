import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const lightGrayColor = Color.fromARGB(255, 190, 190, 190);
  static const darkGrayColor = Color.fromRGBO(77, 77, 77, 1.0);
  static const lightPurpleColor = Color.fromRGBO(163, 157, 255, 1.0);
  static const darkPurpleColor = Color.fromRGBO(108, 99, 255, 1.0);
  static const lightBlueColor = Color.fromRGBO(107, 191, 255, 1.0);
  static const darkBlueColor = Color.fromRGBO(46, 165, 255, 1.0);
  static const redColor = Color.fromRGBO(255, 46, 46, 1.0);


  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: darkGrayColor,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: darkGrayColor,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: darkGrayColor,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0,
      // fontWeight: FontWeight.normal,
      color: darkGrayColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0,
      // fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return darkPurpleColor;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: darkGrayColor,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: darkBlueColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: lightPurpleColor,
        unselectedItemColor: darkPurpleColor,
        backgroundColor: Colors.white
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: darkGrayColor,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: darkGrayColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: darkBlueColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: lightPurpleColor,
        unselectedItemColor: darkPurpleColor,
        backgroundColor: darkGrayColor
      ),
      textTheme: darkTextTheme,
    );
  }
}
