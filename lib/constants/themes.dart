import 'package:flutter/material.dart';

class Themes {
  static final theme = ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      primaryColor: const Color.fromRGBO(125, 125, 125, 1),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
          displayMedium:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500)));
  static Color getColors(ColorsValues value) {
    final List<Color> colorsList = [
      const Color.fromRGBO(125, 125, 125, 1),
      const Color.fromRGBO(217, 217, 217, 1),
    ];

    return colorsList[value.index];
  }
}

enum ColorsValues { DARK_GREY_COLOR, LIGHT_GREY_COLOR }
