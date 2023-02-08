import 'package:flutter/material.dart';

class AppColors {
  static var themecolors =
      //Color(0xff25D366);
      //Color(0xff9bbb4c);
      Color(0xff0abab5);
  static var primaryColor = Color(0xff023382);

  static var golden = Color(0xffDDB37B);

  static var background = Color(0xffECF0F1);
  //static var primaryColor = Color(0xff023382);
  static var textfieldColor = Color(0xff8f98d0);

  static Map<int, Color> primaryColorMap = {
    50: Color(0xff7E00FC),
  };
  static MaterialColor primarySwatch =
      MaterialColor(0xff7E00FC, primaryColorMap);

  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey400 = Colors.grey.shade400;
  static Color backgroundColor = Color(0xFF3284D6);
}

LinearGradient gradient1 = LinearGradient(
  colors: [Color.fromRGBO(53, 68, 147, 1), Color.fromRGBO(18, 33, 90, 1)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

LinearGradient gradient2 = LinearGradient(
  colors: [Color.fromRGBO(53, 67, 163, 1), Color.fromRGBO(85, 101, 189, 1)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient gradient3 = LinearGradient(
    colors: [Color(0xff52abd0), Color(0xfff0c5df)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

LinearGradient gradient4 = LinearGradient(
    colors: [Color(0xff52abd0), Color(0xfff0c5df)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

LinearGradient gradient5 = LinearGradient(
  colors: [Color(0xfffb96f5), Color(0xfff3f3f3)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
