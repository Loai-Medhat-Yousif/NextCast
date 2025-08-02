import 'package:flutter/material.dart';
import 'package:nextcast/Theme/custom_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'MaterialIcons',
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: CustomColors.primaryColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
