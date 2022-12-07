import 'package:flutter/material.dart';

class MyThemeData{
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color darkBlack = Color.fromRGBO(248, 248, 248, 1.0);
  static Color darkPrimary = Color.fromRGBO(20, 26, 46, 1.0);
  static Color yellowColor = Color.fromRGBO(250, 204, 29, 1.0);

 static ThemeData lightTheme = ThemeData(
    primaryColor: colorGold,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorGold,
        onPrimary: Colors.white,
        secondary: colorBlack,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: colorBlack,
        surface: Colors.grey,
        onSurface: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: colorBlack,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
      subtitle1: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: colorBlack,),
    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: colorGold,
     selectedItemColor: colorBlack,
     unselectedItemColor: Colors.white,
   ),
  );

 static ThemeData DarkTheme = ThemeData(
   primaryColor: darkPrimary,
   scaffoldBackgroundColor: Colors.transparent,
   colorScheme: ColorScheme(
       brightness: Brightness.dark,
       primary: darkPrimary,
       onPrimary: Colors.white,
       secondary: yellowColor,
       onSecondary: Colors.white,
       error: Colors.red,
       onError: Colors.white,
       background: Colors.transparent,
       onBackground: yellowColor,
       surface: Colors.grey,
       onSurface: Colors.white),
   appBarTheme: AppBarTheme(
     backgroundColor: Colors.transparent,
     elevation: 0.0,
     centerTitle: true,
     iconTheme: IconThemeData(
       color: Colors.white,
     ),
   ),
   textTheme: TextTheme(
     headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
     subtitle1: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: yellowColor,),
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: darkPrimary,
     selectedItemColor: yellowColor,
     unselectedItemColor: Colors.white,
   ),
 );
}