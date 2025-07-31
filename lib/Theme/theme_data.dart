import 'package:flutter/material.dart';
import 'package:nextcast/Theme/custom_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: CustomColors.primaryColor,
    fontFamily: 'BebasNeue',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
